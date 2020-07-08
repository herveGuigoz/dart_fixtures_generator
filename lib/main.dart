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

Future<void> main(String sportCenter) async {
  await _teamService.writeTeamFixtures(sportCenter);
  await _competitionService.writeCompetitionFixtures(sportCenter);
  await _matchService.writeCompetitionMatchFixtures();
}

/*
const _indentation = '  ';

String indentedString() {
  var map = <String, dynamic>{
    'name': 'abc',
    'type': 'unknown',
    'internal': {'name': 'xyz'},
  };

  final sb = StringBuffer();

  map.forEach((key, value) {
    if (value is String) {
      sb.writeln('$key: $value');
    }
    if (value is Map) {
      sb.writeln('$key:');
      final list = [];
      value.forEach((key, value) {
        list.add({key: value});
      });
      list.forEach((e) {
        sb.writeln(
          '$_indentation${e.keys.toList()[0]}: ${e.values.toList()[0]}',
        );
      });
    }
  });

  return sb.toString();
}
*/

/*
Future<Competition> getFixtures() async {
  final NetworkInterface client = Network();

  final competition = await client.get(kFixturesURL);

  return Competition.fromJson(json.decode(competition));
}
*/
