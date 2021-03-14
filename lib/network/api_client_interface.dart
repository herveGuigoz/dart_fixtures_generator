import 'package:dio/dio.dart';
import 'package:openfootball_fixtures_yaml/network/cache_interceptor.dart';

import 'codecs.dart';

abstract class ApiClientInterface {
  ApiClientInterface({
    required String baseURL,
    Map<String, String>? headers,
  }) : dio = Dio()
          ..options = BaseOptions(baseUrl: baseURL, headers: headers)
          ..interceptors.addAll([
            CacheInterceptor(),
          ]);

  final Dio dio;

  JsonCodecInterface get codecs;

  Future<T> get<T>(
    String path, {
    Map<String, String>? params,
  }) async {
    final response = await dio.get<String>(path, queryParameters: params);

    return codecs.decode<T>(response.data!);
  }
}
