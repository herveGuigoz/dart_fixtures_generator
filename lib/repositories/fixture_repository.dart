import 'dart:convert';
import 'dart:io';

import '../network/network_interface.dart';
import '../models/competition_model.dart';
import '../models/team_model.dart';
import '../models/round_model.dart';

const String kCompetitionURL = '/en.1.json';
// const String kTeamsURL = '/en.1.clubs.json';

class FixtureRepository {
  final NetworkInterface _client;
  Competition _cache;

  FixtureRepository(this._client);

  Future<List<TeamModel>> getTeamsCollection() async {
    final competition = await getCompetition();

    return competition.teams;
  }

  Future<Competition> getCompetition() async {
    if (_cache != null) {
      return _cache;
    }

    final response = await _client.get(kCompetitionURL);

    final asMap = json.decode(response) as Map<String, dynamic>;

    _cache = Competition.fromJson(asMap);

    return _cache;
  }

  Future<List<Round>> getRounds() async {
    final competition = await getCompetition();

    return competition.rounds;
  }
}
