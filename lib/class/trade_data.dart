import 'package:isar/isar.dart';

part 'trade_data.g.dart';

@collection
class TradeData {
  final int id;
  final String? userID;
  final String? userName; 
  final String? tradeId;
  final String? coinId;
  final String? coinName;
  final double? sell;
  final double? buy;
  final DateTime? timestamp;

  TradeData({required this.id, required this.userID, required this.userName, required this.tradeId, required this.coinId, required this.coinName, required this.sell, required this.buy, required this.timestamp});
}