import 'dart:io';

import 'package:http/http.dart' as http;

import 'network_interface.dart';
import '../constantes.dart';
import '../exceptions/app_exceptions.dart';

class Network implements NetworkInterface {
  http.Client client = http.Client();

  Uri _getUri(String path, [Map<String, String> queryParameters]) {
    return Uri.http(kApiBaseURL, path, queryParameters);
  }

  Map<String, String> _getHeader() {
    return <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  @override
  Future<String> get(String path, {Map<String, String> params}) async {
    // final uri = _getUri(path, params);
    final header = _getHeader();

    http.Response response;

    try {
      response = await client.get('$kApiBaseURL$path', headers: header);
    } on SocketException catch (_) {
      throw ServerException('Server error');
    }

    return response.body;
  }

  @override
  Future<String> post(String path, {String body}) async {
    final uri = _getUri(path);
    final header = _getHeader();

    http.Response response;
    try {
      response = await client.post(uri, headers: header, body: body);
    } on SocketException catch (_) {
      throw ServerException('Server error');
    }

    return response.body;
  }
}
