import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:crypto_currency/class/coin.dart';
import 'package:crypto_currency/class/coin_data.dart';
import 'package:crypto_currency/class/setting.dart';
import 'package:crypto_currency/cubit/setting_cubit.dart';
import 'package:crypto_currency/http/api.dart';
import 'package:crypto_currency/utils/isar_db.dart';
import 'package:equatable/equatable.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:isar/isar.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  Map<String, CoinInfo> coinsMap = {};
  Map<String, List<CoinData>> groupedData = {};
  Timer? _pollTimer;
  bool _disposed = false;
  Duration _pollInterval = const Duration(seconds: 5);

  CoinCubit() : super(CoinInitial()) {
    _initCoinInfo().then(
      (value) {
        _startPolling();
      },
    );
  }

  Future<void> _initCoinInfo() async {
    emit(CoinLoading());
    try {
      var infoMap = await Api().getCoinInfoList();
      coinsMap = {};
      var isar = IsarDataBase().isar;
      var trackingList = isar.settings.get(0)?.selectCoins ?? [];
      if (infoMap != null && infoMap['data'] != null) {
        for (var info in infoMap['data']) {
          var coinInfo = CoinInfo.fromJson(info);
          if (trackingList.contains(coinInfo.id)) {
            coinsMap[coinInfo.id] = coinInfo;
          }
        }
      }
      if (coinsMap.isEmpty) {
        emit(const CoinLoaded(coinMap: {}));
      } else {
        _getCoinsFromLocal();
      }
    } catch (e) {
      log('Error fetching coin info: $e');
      emit(const CoinLoaded(coinMap: {}));
    }
  }

  void _getCoinsFromLocal() {
    var isar = IsarDataBase().isar;
    List<CoinData> coinList = [];
    isar.read((_) => {
          coinList = _.coinDatas
              .where()
              .timestampBetween(
                  DateTime.now().subtract(const Duration(hours: 3)),
                  DateTime.now())
              .findAll()
        });
    for (var coin in coinList) {
      if (coin.coinId != null && coin.price != null && coin.timestamp != null) {
        final coinId = coin.coinId!;
        if (!groupedData.containsKey(coinId)) {
          groupedData[coinId] = [];
        }
        groupedData[coinId]!.add(coin);
      }
    }
    // Build priceHistory map for each CoinInfo from the local Isar data
    for (var entry in groupedData.entries) {
      final coinId = entry.key;
      final list = entry.value;
      // sort by timestamp ascending
      list.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      // populate CoinInfo.priceHistory so the small line chart can display
      if (coinsMap.containsKey(coinId)) {
        final priceHistory = <DateTime, double>{};
        for (var d in list) {
          if (d.timestamp != null && d.price != null) {
            priceHistory[d.timestamp!] = d.price!;
          }
        }
        coinsMap[coinId]?.priceHistory = priceHistory;
      }
    }

    // Emit loaded state so UI shows initial data
    emit(CoinLoaded(coinMap: coinsMap));
  }

  List<CandleData> getCandleDataList(String coinId, Duration interval) {
    groupedData[coinId]?.removeWhere(
      (element) {
        return element.timestamp
                ?.isBefore(DateTime.now().subtract(const Duration(hours: 3))) ??
            false;
      },
    );
    return calculateOHLCWithInterval(groupedData, interval)[coinId] ?? [];
  }

  void updateInterval(Duration interval) {
    emit(CoinUpdateInterval(interval: interval));
  }

  void _startPolling() {
    if (_disposed) return;
    // cancel existing timer if any
    _pollTimer?.cancel();
    // run immediately once to seed
    _pollPrices();
    _pollTimer = Timer.periodic(_pollInterval, (_) {
      _pollPrices();
    });
  }

  Future<void> _pollPrices() async {
    if (_disposed) return;
    if (coinsMap.isEmpty) return;
    try {
      final ids = coinsMap.keys.toList();
      var data = await Api().getPricesForAssets(ids);
      if (data == null) return;
      var list = data['data'];
      if (list == null) return;

      var isar = IsarDataBase().isar;
      for (var item in list) {
        try {
          final id = item['id']?.toString();
          final priceStr = item['priceUsd']?.toString() ?? '0';
          final newPrice = double.tryParse(priceStr) ?? 0.0;
          if (id == null) continue;
          final coinInfo = coinsMap[id];
          if (coinInfo == null) continue;

          final prevPrice = double.tryParse(coinInfo.priceUsd) ?? newPrice;
          coinInfo.changePrice = newPrice - prevPrice;
          coinInfo.priceUsd = priceStr;
          coinInfo.priceHistory[DateTime.now()] = newPrice;

          // persist to isar and groupedData
          isar.write((_) {
            var coinData = CoinData(
                id: _.coinDatas.autoIncrement(),
                coinId: coinInfo.id,
                name: coinInfo.name,
                price: newPrice,
                timestamp: DateTime.now());
            groupedData.putIfAbsent(coinInfo.id, () => []).add(coinData);
            _.coinDatas.put(coinData);
          });
        } catch (e) {
          log('Error processing item in poll: $e');
        }
      }

      emit(CoinLoaded(coinMap: coinsMap));
    } catch (e) {
      log('Polling error: $e');
    }
  }

  void refresh() {
    // restart polling after refreshing coin list
    _pollTimer?.cancel();
    _initCoinInfo().then((value) {
      _startPolling();
    });
  }

  @override
  Future<void> close() {
    _disposed = true;
    _pollTimer?.cancel();
    log("close coin cubit");
    return super.close();
  }
}
