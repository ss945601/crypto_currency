import 'package:crypto_currency/http/domain.dart';
import 'package:dio/dio.dart';

class Api {
  // Private constructor
  Api._privateConstructor();

  // The single instance of the class
  static final Api _instance = Api._privateConstructor();

  // Factory constructor to return the single instance
  factory Api() {
    return _instance;
  }

  // Example method
  Future<Map<String, dynamic>?> getCoinInfoList() async {
    var ret = await Dio().get(Domain.instance.coinGap + "/v2/assets");
    if (ret.data != null) {
      return ret.data;
    }
    return null;
  }
}
