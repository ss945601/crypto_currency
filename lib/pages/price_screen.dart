import 'package:crypto_currency/cubit/coin_cubit.dart';
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
          return const Center(child: CircularProgressIndicator());
        } else if (state is CoinError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          if (state is CoinLoaded) {
            coinMap = state.coinMap;
          } else if (state is CoinUpdateInterval) {
            intervalMin = state.interval.inMinutes;
          }
          return Column(
            children: [
              ToggleSwitch(
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
              Expanded(
                child: ListView(
                  children: coinMap.entries.map((entry) {
                    var candles = cubit.getCandleDataList(
                        entry.value.id, Duration(minutes: intervalMin));
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.blueGrey[900]?.withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.zero,
                        child: ExpansionTile(
                          backgroundColor: Colors.blueGrey[900],
                          title: Text(entry.key.toUpperCase()),
                          subtitle: RichText(
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
                                          timeLabel:
                                              (timestamp, visibleDataCount) {
                                            var date = DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    timestamp);
                                            return "${date.hour}:${date.minute}:00";
                                          },
                                        )
                                      : const Center(child: Text("No Data"))),
                            ),
                          ],
                        ),
                      ),
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
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 50,
            showTitles: true,
            interval: maxX != minX
                ? (maxX - minX) / 5
                : null, // Dynamically adjust interval
            getTitlesWidget: (value, _) {
              final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
              return Text(
                "${date.hour}:${date.minute}:${date.second}",
                style: TextStyle(fontSize: 14),
              );
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 50,
            showTitles: true,
            interval: maxY != minY
                ? (maxY - minY) / 5
                : null, // Dynamically adjust interval
            getTitlesWidget: (value, _) {
              return Text(
                value.toStringAsFixed(2),
                style: TextStyle(fontSize: 10),
              );
            },
          ),
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
