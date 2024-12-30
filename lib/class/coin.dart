import 'package:crypto_currency/class/coin_data.dart';
import 'package:interactive_chart/interactive_chart.dart';

class CoinInfo {
    String id;
    String rank;
    String symbol;
    String name;
    String supply;
    dynamic maxSupply;
    String marketCapUsd;
    String volumeUsd24Hr;
    String priceUsd;
    String changePercent24Hr;
    String vwap24Hr;
    String explorer;
    Map<DateTime,double> priceHistory = {};
    double changePrice = 0;

    CoinInfo({
        required this.id,
        required this.rank,
        required this.symbol,
        required this.name,
        required this.supply,
        required this.maxSupply,
        required this.marketCapUsd,
        required this.volumeUsd24Hr,
        required this.priceUsd,
        required this.changePercent24Hr,
        required this.vwap24Hr,
        required this.explorer,
    });

    factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
        id: json["id"],
        rank: json["rank"],
        symbol: json["symbol"],
        name: json["name"],
        supply: json["supply"],
        maxSupply: json["maxSupply"],
        marketCapUsd: json["marketCapUsd"] ?? "",
        volumeUsd24Hr: json["volumeUsd24Hr"] ?? "",
        priceUsd: json["priceUsd"] ?? "",
        changePercent24Hr: json["changePercent24Hr"] ?? "",
        vwap24Hr: json["vwap24Hr"] ?? "",
        explorer: json["explorer"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "symbol": symbol,
        "name": name,
        "supply": supply,
        "maxSupply": maxSupply,
        "marketCapUsd": marketCapUsd,
        "volumeUsd24Hr": volumeUsd24Hr,
        "priceUsd": priceUsd,
        "changePercent24Hr": changePercent24Hr,
        "vwap24Hr": vwap24Hr,
        "explorer": explorer,
    };
}


Map<String, List<CandleData>> calculateOHLCWithInterval(
    Map<String, List<CoinData>> groupedData, Duration interval) {
  // Group data by coinId
  final result = <String, List<CandleData>>{};

  for (var entry in groupedData.entries) {
    final coinId = entry.key;
    final data = entry.value;

    // Sort data by timestamp
    data.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));

    final candles = <CandleData>[];
    DateTime? currentIntervalStart;
    List<CoinData> currentIntervalData = [];

    for (var coin in data) {
      final timestamp = coin.timestamp!;
      if (currentIntervalStart == null ||
          timestamp.isAfter(currentIntervalStart.add(interval))) {
        // Finalize the previous interval
        if (currentIntervalData.isNotEmpty) {
          candles.add(_generateCandleData(currentIntervalStart!, currentIntervalData));
        }

        // Start a new interval
        currentIntervalStart =
            DateTime(timestamp.year, timestamp.month, timestamp.day, timestamp.hour, timestamp.minute)
                .add(Duration(minutes: -(timestamp.minute % interval.inMinutes)));
        currentIntervalData = [];
      }

      currentIntervalData.add(coin);
    }

    // Finalize the last interval
    if (currentIntervalData.isNotEmpty && currentIntervalStart != null) {
      candles.add(_generateCandleData(currentIntervalStart, currentIntervalData));
    }

    result[coinId] = candles;
  }

  return result;
}

CandleData _generateCandleData(DateTime start, List<CoinData> data) {
  final open = data.first.price!;
  final close = data.last.price!;
  final high = data.map((e) => e.price!).reduce((a, b) => a > b ? a : b);
  final low = data.map((e) => e.price!).reduce((a, b) => a < b ? a : b);
  final volume = data.length.toDouble(); // Example volume as count

  return CandleData(
    timestamp: start.millisecondsSinceEpoch,
    open: open,
    high: high,
    low: low,
    close: close,
    volume: volume,
  );
}