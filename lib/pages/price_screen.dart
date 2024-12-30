import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_chart/interactive_chart.dart';

class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<CoinCubit>();
    return BlocBuilder<CoinCubit, CoinState>(
      builder: (context, state) {
        if (state is CoinLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CoinLoaded) {
          return ListView(
            children: state.coinMap.entries.map((entry) {
              var candles = _cubit.getCandleDataList(
                  entry.value.id, const Duration(minutes: 1));
              return ExpansionTile(
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
                        padding: const EdgeInsets.all(20.0),
                        child: candles.length > 3
                            ? InteractiveChart(candles: candles, timeLabel: (timestamp, visibleDataCount) {
                              var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
                              return date.hour.toString() + ":" + date.minute.toString() + ":" + date.second.toString();
                            },)
                            : const Center(child: Text("No Data"))),
                  ),
                ],
              );
            }).toList(),
          );
        } else if (state is CoinError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: CircularProgressIndicator());
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
