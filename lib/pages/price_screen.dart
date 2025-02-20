import 'package:crypto_currency/class/coin.dart';
import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/cubit/setting_cubit.dart';
import 'package:crypto_currency/pages/setting_page.dart';
import 'package:crypto_currency/widgets/history_plot_button.dart';
import 'package:crypto_currency/widgets/loading_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PriceScreen extends StatelessWidget {
  int intervalIdx = 0;
  var coinMap = {};
  var intervalMin = 1;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CoinCubit>();

    return BlocBuilder<CoinCubit, CoinState>(
      builder: (context, state) {
        if (state is CoinLoading) {
          return const LoadingWidget();
        } else if (state is CoinError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          if (state is CoinLoaded) {
            coinMap = state.coinMap;
          } else if (state is CoinUpdateInterval) {
            intervalMin = state.interval.inMinutes;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Center(
                    child: ToggleSwitch(
                      initialLabelIndex: intervalIdx,
                      totalSwitches: 3,
                      labels: const ['1 min', '5 min', '10 min'],
                      onToggle: (index) {
                        intervalIdx = index ?? 0;
                        switch (index) {
                          case 0:
                            cubit.updateInterval(const Duration(minutes: 1));
                            break;
                          case 1:
                            cubit.updateInterval(const Duration(minutes: 5));
                            break;
                          case 2:
                            cubit.updateInterval(const Duration(minutes: 10));
                            break;
                          default:
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _showCoinsSetting(context);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add Tracking Coins"),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: coinMap.entries.map((entry) {
                    var candles = cubit.getCandleDataList(
                        entry.value.id, Duration(minutes: intervalMin));
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _buildCoinCard(entry, candles),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<dynamic> _showCoinsSetting(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<SettingCubit>(),
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)), // Rounded corners
            child: Builder(
              builder: (context) {
                double screenWidth = MediaQuery.of(context).size.width;
                double screenHeight = MediaQuery.of(context).size.height;

                return SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Prevent extra spacing
                    children: [
                      const Expanded(child: SettingPage(isExpand: true,)), // Main content

                      // Cancel Button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pop(context), // Close dialog
                          child: const Text('Cancel'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Card _buildCoinCard(
      MapEntry<dynamic, dynamic> entry, List<CandleData> candles) {
    return Card(
      elevation: 0,
      color: Colors.blueGrey[900]?.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        backgroundColor: Colors.blueGrey[900],
        title: Row(
          children: [
            Text(entry.key.toUpperCase()),
            HistoryPlotButton(coinID: entry.key)
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Price: \$${entry.value.priceUsd} ',
                  ),
                  TextSpan(
                    style: TextStyle(
                        color: entry.value.changePrice > 0
                            ? Colors.green
                            : Colors.red),
                    text:
                        '${entry.value.changePrice > 0 ? '+' : ''} ${entry.value.changePrice.toStringAsFixed(6)}',
                  )
                ]),
              ),
            ),
            Expanded(
                child: SizedBox(
                    height: 50,
                    child: LineChart(
                        _buildLineChartData(entry.value.priceHistory))))
          ],
        ),
        children: [
          SizedBox(
            height: 400,
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: candles.length > 3
                    ? InteractiveChart(
                        key: UniqueKey(),
                        candles: candles,
                        priceLabel: (price) {
                          return price.toStringAsFixed(5);
                        },
                        timeLabel: (timestamp, visibleDataCount) {
                          var date =
                              DateTime.fromMillisecondsSinceEpoch(timestamp);
                          return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:00";
                        },
                      )
                    : const Center(child: Text("No Data"))),
          ),
        ],
      ),
    );
  }

  LineChartData _buildLineChartData(Map<DateTime, double> history) {
    // Convert the history data to FlSpot and calculate min/max values
    final spots = history.entries
        .map((e) => FlSpot(
              e.key.millisecondsSinceEpoch.toDouble(),
              e.value,
            ))
        .toList();

    if (spots.isEmpty) {
      return LineChartData(); // Handle empty data gracefully
    }

    final minX = spots.first.x;
    final maxX = spots.last.x;
    final minY = spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);

    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(show: false),
          dotData: FlDotData(show: false),
        ),
      ],
      titlesData: const FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
        ),
      ),
      gridData: FlGridData(show: true),
      borderData: FlBorderData(show: true),
      minX: minX,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
    );
  }
}
