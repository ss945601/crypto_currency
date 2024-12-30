import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:crypto_currency/class/coin.dart';
import 'package:crypto_currency/class/coin_data.dart';
import 'package:crypto_currency/http/api.dart';
import 'package:crypto_currency/utils/isar_db.dart';
import 'package:equatable/equatable.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:isar/isar.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  Map<String, CoinInfo> coinsMap = {};
  Map<String, List<CoinData>> groupedData = {};
  late WebSocketChannel _channel;

  CoinCubit() : super(CoinInitial()) {
    _initCoinInfo().then(
      (value) {
        _buildCoinListener();
      },
    );
  }

  Future<void> _initCoinInfo() async {
    var infoMap = await Api().getCoinInfoList();
    for (var info in infoMap!['data']) {
      var coinInfo = CoinInfo.fromJson(info);
      coinsMap[coinInfo.id] = coinInfo;
      if (coinsMap.length > 9) {
        break;
      }
    }
    _getCoinsFromLocal();
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

  void _buildCoinListener() {
    var isar = IsarDataBase().isar;
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.coincap.io/prices?assets=${coinsMap.keys.join(',')}'),
    );
    _channel.stream.listen((event) {
      var prices = Map<String, String>.from(json.decode(event));
      prices.forEach((key, value) {
        coinsMap[key]?.changePrice = (double.tryParse(value)! -
            double.tryParse(coinsMap[key]!.priceUsd)!);
        coinsMap[key]?.priceUsd = value;
        coinsMap[key]?.priceHistory[DateTime.now()] =
            double.tryParse(value) ?? 0.0;

        isar.write((_) {
          var coin = coinsMap[key];
          if (coin != null) {
            var coinData = CoinData(
                id: _.coinDatas.autoIncrement(),
                coinId: coin.id,
                name: coin.name,
                price: double.tryParse(value) ?? 0.0,
                timestamp: DateTime.now());
            groupedData[coin.id]!.add(coinData);
            _.coinDatas.put(coinData); // insert & update
          }
        });
      });
      emit(CoinLoaded(coinMap: coinsMap));
    });
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }
}
