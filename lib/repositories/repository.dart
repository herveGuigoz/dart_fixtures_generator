import 'package:openfootball_fixtures_yaml/entities/_entities.dart';
import 'package:openfootball_fixtures_yaml/network/api_client.dart';
import 'package:openfootball_fixtures_yaml/network/api_client_interface.dart';
import 'package:openfootball_fixtures_yaml/network/codecs.dart';
import 'package:openfootball_fixtures_yaml/ressources/_ressources.dart';
import 'package:openfootball_fixtures_yaml/services/uuid.dart';
import 'package:riverpod/riverpod.dart';

final repositoryRef = Provider((ref) => Repository(ref.read));

class Cache {
  Cache(this.teams);

  final List<Team> teams;

  int getTeamId(Team team) => teams.indexOf(team) + 1;

  int findTeamIdByName(String value) {
    final team = teams.firstWhere((team) => team.name == value);
    return getTeamId(team);
  }
}

class Repository {
  Repository(this._read);

  final Reader _read;

  ApiClientInterface get _apiClient => _read(apiClientRef);

  UuidService get uuid => _read(uuidRef);

  Cache? cache;

  Future<MatchesResponse> findMatchesResponse() async {
    final response = await _apiClient.get<MatchesResponse>('/en.1.json');
    return response;
  }

  Future<List<Match>> findMatches() async {
    final response = await findMatchesResponse();
    return response.matches;
  }

  Future<List<Club>> findClubs() async {
    final response = await _apiClient.get<ClubsResponse>(
      '/en.1.clubs.json',
    );

    return response.clubs;
  }

  Future<List<Team>> getTeams() async {
    if (cache == null) {
      final clubs = await findClubs();
      final teams = clubs.map((club) => Team.fromClub(club)).toList();
      cache = Cache(teams);
    }

    return cache!.teams;
  }

  Future<Competition> getCompetition() async {
    final response = await findMatchesResponse();
    return Competition(
      id: uuid.competitionId,
      name: response.league,
      date: response.matches.first.date,
    );
  }

  Future<List<CompetitionTeam>> getCompetitionTeam() async {
    final teams = await getTeams();
    final matches = await findMatches();
    final competitionTeam = <CompetitionTeam>[];

    for (final team in teams) {
      final wins = matches.wins(team);
      final draw = matches.draws(team);
      final losses = matches.losses(team);
      final goalsScored = matches.goalsScored(team);
      final goalsAgainst = matches.goalsAgainst(team);

      competitionTeam.add(CompetitionTeam(
        teamId: cache!.getTeamId(team),
        victoriesTotal: wins,
        drawsTotal: draw,
        defeatsTotal: losses,
        pointsTotal: (wins * 3) + draw,
        goalsForTotal: goalsScored,
        goalsAgainstTotal: goalsAgainst,
        difference: goalsScored - goalsAgainst,
      ));
    }

    return competitionTeam.addRanking();
  }
}

extension CompetitionTeamExt on List<CompetitionTeam> {
  List<CompetitionTeam> addRanking() {
    final ranked = <CompetitionTeam>[];

    final sorted = [...this]..sort(
        (teamA, teamB) => teamB.pointsTotal.compareTo(teamA.pointsTotal),
      );

    sorted.asMap().forEach((index, team) {
      ranked.add(team.copyWith(ranking: index + 1));
    });

    return ranked;
  }
}

extension Ranking on List<Match> {
  int wins(Team team) => homeWins(team) + awayWins(team);

  int losses(Team team) => homeLosses(team) + awayLosses(team);

  int draws(Team team) {
    return where((match) =>
        match.played &&
        match.isDraw &&
        (match.team1 == team.name || match.team2 == team.name)).length;
  }

  int goalsScored(Team team) {
    return goalsScoredAtHome(team) + goalsScoredOnRoad(team);
  }

  int goalsAgainst(Team team) {
    return goalsAgainstAtHome(team) + goalsAgainstOnRoad(team);
  }

  List<Match> playedAtHome(Team team) {
    return where((match) => match.played && match.team1 == team.name).toList();
  }

  List<Match> playedOnRoad(Team team) {
    return where((match) => match.played && match.team2 == team.name).toList();
  }

  int homeWins(Team team) {
    return playedAtHome(team).where((match) => match.isHomeWin).length;
  }

  int homeLosses(Team team) {
    return playedAtHome(team).where((match) => match.isAwayWin).length;
  }

  int awayWins(Team team) {
    return playedOnRoad(team).where((match) => match.isAwayWin).length;
  }

  int awayLosses(Team team) {
    return playedOnRoad(team).where((match) => match.isHomeWin).length;
  }

  int goalsScoredAtHome(Team team) {
    return homeScores(team).reduce((a, b) => a + b);
  }

  int goalsScoredOnRoad(Team team) {
    return awayScores(team).reduce((a, b) => a + b);
  }

  int goalsAgainstAtHome(Team team) {
    return homeScoresAgainst(team).reduce((a, b) => a + b);
  }

  int goalsAgainstOnRoad(Team team) {
    return awayScoresAgainst(team).reduce((a, b) => a + b);
  }

  List<int> homeScores(Team team) {
    return playedAtHome(team).map((match) => match.homeScore).toList();
  }

  List<int> awayScores(Team team) {
    return playedOnRoad(team).map((match) => match.awayScore).toList();
  }

  List<int> homeScoresAgainst(Team team) {
    return playedAtHome(team).map((match) => match.awayScore).toList();
  }

  List<int> awayScoresAgainst(Team team) {
    return playedOnRoad(team).map((match) => match.homeScore).toList();
  }
}

class MatchesResponse {
  MatchesResponse(this.league, this.matches);

  final String league;
  final List<Match> matches;
}

class MatchesResponseCodec extends JsonCodec<MatchesResponse> {
  const MatchesResponseCodec();

  @override
  MatchesResponse decodeMap(Map<String, dynamic> json) {
    return MatchesResponse(
      json['name'] as String,
      (json['matches'] as List<dynamic>).map((e) {
        final map = e as Map<String, dynamic>;
        return Match.fromJson(map);
      }).toList(),
    );
  }

  @override
  Map<String, dynamic> encodeMap(MatchesResponse value) {
    throw UnimplementedError();
  }
}

class ClubsResponse {
  ClubsResponse({
    required this.league,
    required this.clubs,
  });

  final String league;
  final List<Club> clubs;
}

class ClubsResponseCodec extends JsonCodec<ClubsResponse> {
  const ClubsResponseCodec();

  @override
  ClubsResponse decodeMap(Map<String, dynamic> json) {
    return ClubsResponse(
      league: json['name'] as String,
      clubs: (json['clubs'] as List<dynamic>).map((e) {
        final map = e as Map<String, dynamic>;
        return Club.fromJson(map);
      }).toList(),
    );
  }

  @override
  Map<String, dynamic> encodeMap(ClubsResponse value) {
    throw UnimplementedError();
  }
}
