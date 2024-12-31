import 'package:isar/isar.dart';

part 'setting.g.dart';

@collection
class Setting {
  final int id;
  List<String> selectCoins = [];

  Setting({required this.id, required this.selectCoins});
}