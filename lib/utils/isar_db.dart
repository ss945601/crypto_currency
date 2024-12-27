import 'package:isar/isar.dart';

import 'dart:io';


import '../class/coin_data.dart';

class IsarDataBase {
  static final IsarDataBase _instance = IsarDataBase._internal();
  late final Isar _isar;

  // Private constructor
  IsarDataBase._internal();

  // Singleton instance
  factory IsarDataBase() {
    return _instance;
  }

  // Initialize Isar database
  Future<void> init() async {
    final dir = await Directory.systemTemp.createTemp();
    _isar = Isar.open(schemas: [CoinDataSchema], directory: dir.path);
  }

  Isar get isar => _isar;

  // Close the database
  Future<void> close() async {
    await _isar.close();
  }
}
