import 'package:crypto_currency/class/setting.dart';
import 'package:crypto_currency/extensions/date_extension.dart';
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
  // Get the system's temporary directory
  final tempDir = Directory.systemTemp;

  // Define the name of the folder you want to create
  final folderName = 'isar_db_${DateTime.now().showDateCustomFormat()}';

  // Create the full path for the new folder
  final newFolderPath = '${tempDir.path}/$folderName';
  final newFolderPathCommon = '${tempDir.path}/settings';

  // Create a Directory object for the new folder
  final newFolder = Directory(newFolderPath);

  // Check if the directory exists
  if (await newFolder.exists()) {
    print('Directory already exists: $newFolderPath');
  } else {
    // If it doesn't exist, create it
    await newFolder.create();
    print('Directory created: $newFolderPath');
  }
    _isar = Isar.open(schemas: [CoinDataSchema, SettingSchema], directory: newFolderPath);
  }

  Isar get isar => _isar;

  // Close the database
  Future<void> close() async {
    await _isar.close();
  }
}
