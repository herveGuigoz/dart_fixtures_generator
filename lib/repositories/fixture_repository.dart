import 'dart:convert';
import 'dart:io';

import '../network/network_interface.dart';
import '../models/competition_model.dart';
import '../models/team_model.dart';
import '../models/round_model.dart';
import '../main.dart';

class FixtureRepository {
  final NetworkInterface _client;

  FixtureRepository(this._client);

  String _getCompetitionIRI(String league) => '/$league.1.json';

  Future<List<TeamModel>> getTeamsCollection(String league) async {
    final competition = await getCompetition(league);

    return competition.teams;
  }

  Future<Competition> getCompetition(String league) async {
    final fromCache = cacheService.getCompetition(league);
    if (fromCache != null) {
      return fromCache;
    }

    final response = await _client.get(_getCompetitionIRI(league));

    final asMap = json.decode(response) as Map<String, dynamic>;

    final competition = Competition.fromJson(asMap, league);

    cacheService.saveCompetition(competition);

    return competition;
  }

  Future<List<Round>> getRounds(String league) async {
    final competition = await getCompetition(league);

    return competition.rounds;
  }
}
