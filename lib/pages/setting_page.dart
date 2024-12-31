import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/cubit/setting_cubit.dart';
import 'package:crypto_currency/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var settingCubit = context.read<SettingCubit>();
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        if (state is SettingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView(padding: EdgeInsets.all(20.0), children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Tracking List", style: TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                children: _buildCoinSetting(settingCubit.coinIDList),
              ),
            ),
          ]);
        }
      },
    );
  }

  List<Widget> _buildCoinSetting(List<String> coinIDList) {
    List<Widget> coinSettingItems = [];
    for (var coinID in coinIDList) {
      coinSettingItems.add(
        StatefulBuilder(builder: (context, state) {
          var settingCubit = context.read<SettingCubit>();
          List<String> trackingCoinList = settingCubit.selectedCoins;
          bool isSelected = trackingCoinList.contains(coinID);
          return GestureDetector(
            onTap: () {
              state(() {
                if (isSelected) {
                  trackingCoinList.remove(coinID);
                } else {
                  trackingCoinList.add(coinID);
                }
                settingCubit.updateSelectCoins(trackingCoinList);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Colors.white),
              ),
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(4.0),
              child: Text(
                coinID,
              ),
            ),
          );
        }),
      );
    }
    return coinSettingItems;
  }
}
