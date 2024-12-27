// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'coin_data.g.dart';

@collection
class CoinData {
  final int id;
  final String? coinId;
  final String? name;
  final double? price;
  final DateTime? timestamp;

  CoinData({required this.id, required this.coinId, required this.name, required this.price, required this.timestamp});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'coinId': coinId,
      'name': name,
      'price': price,
      'timestamp': timestamp?.millisecondsSinceEpoch,
    };
  }

  factory CoinData.fromMap(Map<String, dynamic> map) {
    return CoinData(
      id: map['id'] as int,
      coinId: map['coinId'] != null ? map['coinId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      timestamp: map['timestamp'] != null ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinData.fromJson(String source) => CoinData.fromMap(json.decode(source) as Map<String, dynamic>);
}
