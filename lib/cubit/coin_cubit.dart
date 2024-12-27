import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/class/coin.dart';
import 'package:crypto_currency/class/coin_data.dart';
import 'package:crypto_currency/http/api.dart';
import 'package:crypto_currency/utils/isar_db.dart';
import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  Map<String, CoinInfo> coinsMap = {};
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
            _.coinDatas.put(CoinData(
                id: _.coinDatas.autoIncrement(),
                coinId: coin.id,
                name: coin.name,
                price: double.tryParse(value) ?? 0.0,
                timestamp: DateTime.now())); // insert & update
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
