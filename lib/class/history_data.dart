class HistoryData {
  List<Datum> data;

  HistoryData({
    required this.data,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) {
    // Check if "data" is present and is a List
    var dataJson = json["data"];
    List<Datum> dataList = [];
    
    if (dataJson != null && dataJson is List) {
      dataList = List<Datum>.from(dataJson.map((x) => Datum.fromJson(x)));
    }

    return HistoryData(data: dataList);
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String priceUsd;
  int time;
  DateTime date;

  Datum({
    required this.priceUsd,
    required this.time,
    required this.date,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    // Use null-aware operators to provide defaults if necessary
    return Datum(
      priceUsd: json["priceUsd"] ?? '0.0', // Default value for priceUsd
      time: json["time"] ?? 0, // Default value for time
      date: json["date"] != null ? DateTime.parse(json["date"]) : DateTime.now(), // Default to current date if null
    );
  }

  Map<String, dynamic> toJson() => {
        "priceUsd": priceUsd,
        "time": time,
        "date": date.toIso8601String(),
      };
}