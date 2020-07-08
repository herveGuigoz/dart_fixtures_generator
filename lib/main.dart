import 'package:openfootball_fixtures_yaml/services/cache_service.dart';

import 'network/network.dart';
import 'network/network_interface.dart';
import 'repositories/fixture_repository.dart';
import 'services/tems_service.dart';
import 'services/competition_service.dart';
import 'services/match_service.dart';

final NetworkInterface _network = Network();
final FixtureRepository _repository = FixtureRepository(_network);
final TeamService _teamService = TeamService(_repository);
final CompetitionService _competitionService = CompetitionService(_repository);
final MatchService _matchService = MatchService(_repository);

final cacheService = CacheService();

Future<void> main(List<String> leagues) async {
  await _teamService.writeTeamFixtures(leagues);
  await _competitionService.writeCompetitionFixtures(leagues);
  await _matchService.writeCompetitionMatchFixtures(leagues);
}
