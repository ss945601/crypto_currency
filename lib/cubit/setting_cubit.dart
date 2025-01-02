import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/class/setting.dart';
import 'package:crypto_currency/http/api.dart';
import 'package:crypto_currency/utils/isar_db.dart';
import 'package:equatable/equatable.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial()) {
    _init();
  }

  final List<String> coinIDList = [];
  List<String> selectedCoins = [];

  void _init() {
    emit(SettingLoading());
    var isar = IsarDataBase().isar;
    var tmp = isar.settings.get(0);
    selectedCoins = tmp?.selectCoins ?? [];
    Api().getCoinInfoList().then((infoMap) {
      var data = infoMap?['data'] as List<dynamic>;
      data.forEach(
        (element) {
          coinIDList.add(element['id']);
        },
      );
      emit(SettingLoaded(coinIdList: coinIDList));
    });
  }

  void updateSelectCoins(List<String> coins) {
    selectedCoins = coins;
    var isar = IsarDataBase().isar;
    
    isar.write((_) {
      var tmp = Setting(id: 0, selectCoins: coins);
      _.settings.put(tmp);
    });
    emit(SettingUpdateCoinList());
  }
}
