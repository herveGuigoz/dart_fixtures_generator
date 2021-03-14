import 'dart:async';

import 'package:dio/dio.dart';

/// Simple cache policy.
/// Call force refresh by setting 'refresh' key to true
/// in request's options.extra map.
class CacheInterceptor extends Interceptor {
  /// Cached responses.
  final _cache = <Uri, Response>{};

  @override
  Future onRequest(RequestOptions options) async {
    /// skip.
    if (options.extra['cache'] == false) return options;

    /// Find response in cache.
    final response = _cache[options.uri];

    /// request ask to refresh cache.. skip
    if (options.extra['refresh'] == true) {
      return options;

      /// cache contains response handle response.
    } else if (response != null) {
      return response;
    }
  }

  @override
  Future onResponse(Response response) async {
    /// paths doesn't reference this request.. skip.
    if (response.extra['cache'] == false) return response;

    /// add response to cache.
    _cache[response.request.uri] = response;
  }

  @override
  Future onError(DioError err) async {
    /// do nothing here.
    return err;
  }
}
