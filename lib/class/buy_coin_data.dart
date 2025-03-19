import 'dart:convert';

import 'package:crypto_currency/class/coin_data.dart';
import 'package:isar/isar.dart';

part 'buy_coin_data.g.dart';

@collection
class BuyCoinData {
  final int id;
  final String walletID;
  final String? coinId;
  final String? coinName;
  final double? price;
  final DateTime? timestamp;

  BuyCoinData({required this.id, required this.walletID, required this.coinId, required this.coinName, required this.price, required this.timestamp});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'coinId': coinId,
      'name': coinName,
      'price': price,
      'timestamp': timestamp?.millisecondsSinceEpoch,
    };
  }

  factory BuyCoinData.fromMap(Map<String, dynamic> map) {
    return BuyCoinData(
      id: map['id'] as int,
      walletID: map['wallet_id'] as String,
      coinId: map['coinId'] != null ? map['coinId'] as String : null,
      coinName: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      timestamp: map['timestamp'] != null ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuyCoinData.fromJson(String source) => BuyCoinData.fromMap(json.decode(source) as Map<String, dynamic>);
}
