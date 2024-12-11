import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/class/coin.dart';
import 'package:crypto_currency/http/api.dart';
import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  Map<String, CoinInfo> coinsMap = {};
  late WebSocketChannel _channel;

  CoinCubit() : super(CoinInitial()) {
    _initCoinInfo().then((value) {
      _buildCoinListener();
    },);
  }

  Future<void> _initCoinInfo() async {
    var infoMap = await Api().getCoinInfoList();
    for (var info in infoMap!['data']) {
      var coinInfo = CoinInfo.fromJson(info);
      coinsMap[coinInfo.id] = coinInfo;
      if (coinsMap.length > 7) {
        break;
      }
    }
  }

  void _buildCoinListener() {
    print(coinsMap.keys.join(','));
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.coincap.io/prices?assets=${coinsMap.keys.join(',')}'),
    );
    _channel.stream.listen((event) {
      var prices = Map<String, String>.from(json.decode(event));
      prices.forEach((key, value) {
        coinsMap[key]?.priceUsd = value;
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
