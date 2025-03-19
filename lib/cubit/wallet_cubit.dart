import 'package:bloc/bloc.dart';
import 'package:crypto_currency/class/coin.dart';
import 'package:crypto_currency/class/coin_data.dart';
import 'package:crypto_currency/class/trade_data.dart';
import 'package:crypto_currency/class/wallet_info.dart';
import 'package:crypto_currency/extensions/string_extension.dart';
import 'package:crypto_currency/utils/isar_db.dart';
import 'package:equatable/equatable.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  void buyCoin(WalletInfo walletInfo, CoinInfo coinInfo, double amount) {
    var isar = IsarDataBase().isar;
    isar.write((_) {
      var data = TradeData(
        buy: double.parse(coinInfo.priceUsd),
        id: _.tradeDatas.autoIncrement(),
        userID: walletInfo.userID,
        userName: walletInfo.userName,
        tradeId: "trade_".generateRandomAlphabet(8),
        coinId: coinInfo.id,
        coinName: coinInfo.name,
        sell: 0, // Buy operation has no sell price
        timestamp: DateTime.now(),
      );
      _.tradeDatas.put(data);
    });
  }

  void sellCoin(WalletInfo walletInfo, CoinData buyCoinData, CoinData sellCoinData) {
    var isar = IsarDataBase().isar;
    isar.write((_) {
      var data = TradeData(
        buy: buyCoinData.price,
        id: _.tradeDatas.autoIncrement(),
        userID: walletInfo.userID,
        userName: walletInfo.userName,
        tradeId: "trade_".generateRandomAlphabet(8),
        coinId: buyCoinData.coinId,
        coinName: buyCoinData.name,
        sell: sellCoinData.price,
        timestamp: DateTime.now(),
      );
      _.tradeDatas.put(data);
    });
  }
}