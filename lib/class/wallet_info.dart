import 'package:crypto_currency/class/coin_data.dart';
import 'package:crypto_currency/class/trade_data.dart';

class WalletInfo {
  String userID = "";
  double usd = 0.0;
  List<CoinData> buyCoins = [];
  List<TradeData> tradeData = [];
}