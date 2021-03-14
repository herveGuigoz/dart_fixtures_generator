import 'dart:io';

import 'package:openfootball_fixtures_yaml/network/codecs.dart';
import 'package:openfootball_fixtures_yaml/repositories/repository.dart';
import 'package:riverpod/riverpod.dart';

import '../constantes.dart';
import 'api_client_interface.dart';

final apiClientRef = Provider((ref) => ApiClient());

class ApiClient extends ApiClientInterface {
  ApiClient()
      : super(
          baseURL: kApiBaseURL,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        );

  @override
  JsonCodecInterface get codecs => JsonCodecs();
}

class JsonCodecs extends JsonCodecInterface {
  @override
  Map<Type, JsonCodec> get codecs {
    return {
      MatchesResponse: const MatchesResponseCodec(),
      ClubsResponse: const ClubsResponseCodec(),
    };
  }
}
