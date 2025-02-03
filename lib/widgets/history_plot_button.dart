import 'package:crypto_currency/class/history_data.dart';
import 'package:crypto_currency/http/api.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum HistoryInterval { m1, m5, m15, m30, h1, h2, h6, h12, d1 }

// ignore: must_be_immutable
class HistoryPlotButton extends StatelessWidget {
  final String coinID;

  HistoryPlotButton({super.key, required this.coinID});

  HistoryInterval _selectedInterval = HistoryInterval.d1;

  Future<void> _showHistoryPlotDialog(BuildContext context) async {
    HistoryData historyData = HistoryData.fromJson(await Api()
            .getAssetHistory(id: coinID, interval: _selectedInterval.name) ??
        {});

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              key: UniqueKey(),
              title: const Text('Price History'),
              content: Column(
                children: [
                  DropdownButton<HistoryInterval>(
                    value: _selectedInterval,
                    onChanged: (HistoryInterval? newValue) {
                      if (newValue != null) {
                        _selectedInterval = newValue;
                        Api()
                            .getAssetHistory(
                                id: coinID, interval: _selectedInterval.name)
                            .then((value) {
                          state(() {
                            historyData = HistoryData.fromJson(value ?? {});
                          });
                        });
                      }
                    },
                    items: HistoryInterval.values.map((interval) {
                      return DropdownMenuItem(
                        value: interval,
                        child: Text(interval.name.toUpperCase()),
                      );
                    }).toList(),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: LineChart(
                        LineChartData(
                            gridData: const FlGridData(show: false),
                            titlesData: const FlTitlesData(
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(show: true),
                            minY: 0,
                            maxY: historyData.data
                                .map((datum) => double.parse(datum.priceUsd))
                                .reduce((a, b) => a > b ? a : b),
                            lineBarsData: [
                              LineChartBarData(
                                spots: historyData.data.map((datum) {
                                  return FlSpot(
                                      datum.date.millisecondsSinceEpoch
                                          .toDouble(),
                                      double.parse(datum.priceUsd));
                                }).toList(),
                                isCurved: true,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                            lineTouchData: LineTouchData(
                              touchTooltipData: LineTouchTooltipData(
                                getTooltipItems:
                                    (List<LineBarSpot> touchedSpots) {
                                  return touchedSpots.map((spot) {
                                    final dateTime =
                                        DateTime.fromMillisecondsSinceEpoch(
                                            spot.x.toInt());
                                    final price = spot.y;

                                    String formattedDate;
                                    switch (_selectedInterval) {
                                      case HistoryInterval.d1:
                                        formattedDate =
                                            "${dateTime.month}/${dateTime.day}";
                                        break;
                                      case HistoryInterval.h1:
                                      case HistoryInterval.h2:
                                      case HistoryInterval.h6:
                                      case HistoryInterval.h12:
                                        formattedDate =
                                            "${dateTime.month}/${dateTime.day} ${dateTime.hour}h";
                                        break;
                                      default: // m1, m5, m15, m30
                                        formattedDate =
                                            "${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
                                        break;
                                    }

                                    return LineTooltipItem(
                                      '$formattedDate \n ${price.toStringAsFixed(6)}', // Display formatted date and price
                                      const TextStyle(color: Colors.white),
                                    );
                                  }).toList();
                                },
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor:
                        Colors.white, // Text color (was 'onPrimary')
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      side: const BorderSide(
                          color: Colors.white, width: 1.0), // Border properties
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // Button padding
                    textStyle: const TextStyle(fontSize: 16), // Text style
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'View Price History',
      padding: const EdgeInsets.all(0),
      color: Colors.grey,
      onPressed: () => _showHistoryPlotDialog(context),
      icon: const Icon(Icons.poll_outlined),
    );
  }
}
