import 'package:crypto_currency/http/domain.dart';
import 'package:dio/dio.dart';

enum CoinApi {
  assets,
  assetById,
  assetMarkets,
  assetHistory,
  exchanges,
  markets,
  rates;
  
  String get value {
    switch (this) {
      case assets:
        return '/v3/assets';
      case assetById:
        return '/v3/assets'; // Add /{slug} when calling
      case assetMarkets:
        return '/v3/assets'; // Add /{slug}/markets when calling
      case assetHistory:
        return '/v3/assets'; // Add /{slug}/history when calling
      case exchanges:
        return '/v3/exchanges';
      case markets:
        return '/v3/markets';
      case rates:
        return '/v3/rates';
      default:
        return '';
    }
  }
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

  // Get Dio instance with configured headers
  Dio _getDio() {
    final dio = Dio();
    final apiKey = Domain.instance.apiKey;
    
    if (apiKey != null && apiKey.isNotEmpty) {
      // Add Bearer token authentication for CoinCap Pro API
      dio.options.headers['Authorization'] = 'Bearer $apiKey';
    }
    
    return dio;
  }

  // Get list of all assets
  Future<Map<String, dynamic>?> getCoinInfoList() async {
    try {
      var ret = await _getDio().get(
        Domain.instance.coinGap + CoinApi.assets.value,
      );
      if (ret.data != null) {
        return ret.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Get current prices for multiple assets by ids (comma separated)
  Future<Map<String, dynamic>?> getPricesForAssets(List<String> ids) async {
    try {
      final params = <String, dynamic>{};
      if (ids.isNotEmpty) params['ids'] = ids.join(',');
      // CoinCap returns the same /v3/assets endpoint filtered by ids
      var ret = await _getDio().get(
        Domain.instance.coinGap + CoinApi.assets.value,
        queryParameters: params,
      );
      if (ret.data != null) {
        return ret.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Get specific asset by slug (e.g., 'bitcoin')
  Future<Map<String, dynamic>?> getCoinInfo(String slug) async {
    try {
      var ret = await _getDio().get(
        '${Domain.instance.coinGap}${CoinApi.assetById.value}/$slug',
      );
      if (ret.data != null) {
        return ret.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Get markets for a specific asset
  Future<Map<String, dynamic>?> getAssetMarkets(String slug) async {
    try {
      var ret = await _getDio().get(
        '${Domain.instance.coinGap}${CoinApi.assetMarkets.value}/$slug/markets',
      );
      if (ret.data != null) {
        return ret.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Get historical data for a specific asset
  Future<Map<String, dynamic>?> getAssetHistory(
    String slug, {
    String interval = '1d', // m1, m5, m15, m30, h1, h2, h6, h12, d1
    int? start,
    int? end,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'interval': interval,
      };
      if (start != null) queryParams['start'] = start;
      if (end != null) queryParams['end'] = end;

      var ret = await _getDio().get(
        '${Domain.instance.coinGap}${CoinApi.assetHistory.value}/$slug/history',
        queryParameters: queryParams,
      );
      if (ret.data != null) {
        return ret.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
