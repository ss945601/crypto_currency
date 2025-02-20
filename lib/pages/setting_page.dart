import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/cubit/setting_cubit.dart';
import 'package:crypto_currency/main.dart';
import 'package:crypto_currency/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    this.isExpand = false,
    super.key,
  });
  final bool isExpand;
  @override
  Widget build(BuildContext context) {
    var settingCubit = context.read<SettingCubit>();
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        if (state is SettingLoading) {
          return const LoadingWidget();
        } else {
          return ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2), // Change the color of the border
                    width: 2.0, // Adjust the width of the border
                  ),
                  borderRadius: BorderRadius.circular(
                      10.0), // Optional: to round the corners
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.currency_bitcoin),
                  title: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Text("Tracking List", style: TextStyle(fontSize: 16)),
                  ),
                  initiallyExpanded:
                      isExpand, // Set to true if you want it open by default
                  enabled: !isExpand, //
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Wrap(
                        children: _buildCoinSetting(settingCubit.coinIDList),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
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
