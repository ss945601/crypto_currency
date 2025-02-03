import 'package:crypto_currency/http/domain.dart';
import 'package:dio/dio.dart';


class CoinApi {
  static String assets = '${Domain.instance.coinGap}/v2/assets';
  static String assetById(String id) => '${Domain.instance.coinGap}/v2/assets/$id';
  static String assetHistory(String id) => '${Domain.instance.coinGap}/v2/assets/$id/history';
  static String assetMarkets(String id) => '${Domain.instance.coinGap}/v2/assets/$id/markets';
  static String exchanges = '${Domain.instance.coinGap}/v2/exchanges';
  static String exchangeById(String id) => '${Domain.instance.coinGap}/v2/exchanges/$id';
  static String exchangeMarkets(String id) => '${Domain.instance.coinGap}/v2/exchanges/$id/markets';
  static String rates = '${Domain.instance.coinGap}/v2/rates';
  static String rateByAssetId(String id) =>'${Domain.instance.coinGap}/v2/rates/$id';
  static String candles = '${Domain.instance.coinGap}/v2/candles';
  static String candlesBySymbol(String symbol) => '${Domain.instance.coinGap}/v2/candles/$symbol';
}
class Api {
  // Private constructor
  Api._privateConstructor();

  // The single instance of the class
  static final Api _instance = Api._privateConstructor();

  // Factory constructor to return the single instance
  factory Api() {
    return _instance;
  }

  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> getAssets({int? limit, int? offset}) async {
    final queryParameters = {
      if (limit != null) 'limit': limit,
      if (offset != null) 'offset': offset,
    };
    var ret = await _dio.get(CoinApi.assets, queryParameters: queryParameters);
    return ret.data;
  }

  Future<Map<String, dynamic>?> getAssetById(String id) async {
    var ret = await _dio.get(CoinApi.assetById(id));
    return ret.data;
  }

  Future<Map<String, dynamic>?> getAssetHistory({
    required String id,
    required String interval,
    String? start,
    String? end,
  }) async {
    final queryParameters = {
      'interval': interval,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
    };
    var ret = await _dio.get(CoinApi.assetHistory(id), queryParameters: queryParameters);
    return ret.data;
  }

  Future<Map<String, dynamic>?> getAssetMarkets({
    required String id,
    String? limit,
    String? offset,
  }) async {
    final queryParameters = {
      if (limit != null) 'limit': limit,
      if (offset != null) 'offset': offset,
    };
    var ret = await _dio.get(CoinApi.assetMarkets(id), queryParameters: queryParameters);
    return ret.data;
  }

  Future<Map<String, dynamic>?> getExchanges() async {
    var ret = await _dio.get(CoinApi.exchanges);
    return ret.data;
  }

  Future<Map<String, dynamic>?> getExchangeById(String id) async {
    var ret = await _dio.get(CoinApi.exchangeById(id));
    return ret.data;
  }

  Future<Map<String, dynamic>?> getRates() async {
    var ret = await _dio.get(CoinApi.rates);
    return ret.data;
  }
}