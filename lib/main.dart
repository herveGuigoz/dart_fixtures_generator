import 'package:openfootball_fixtures_yaml/services/session_service.dart';
import 'package:riverpod/riverpod.dart';

import 'services/competition_service.dart';
import 'services/team_service.dart';

Future<void> main(List<String> leagues) async {
  final scope = ProviderContainer();

  final competition = scope.read(competitionServiceRef);
  await competition.writeCompetitionFixture();

  final teamService = scope.read(teamServiceRef);
  await teamService.writeTeamFixtures();
  await teamService.writeCompetitionTeamFixtures();

  final sessionService = scope.read(sessionServiceRef);
  await sessionService.writeSessionFixtures();
  await sessionService.writeSessionTeamFixtures();
}
