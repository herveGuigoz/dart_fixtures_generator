import 'dart:convert';

import 'models/competition_model.dart';
import 'network/network.dart';
import 'network/network_interface.dart';

import 'constantes.dart';

import 'utils/extensions.dart';

import 'services/tems_service.dart';

final NetworkInterface _network = Network();
final TeamService _teamService = TeamService(_network);

Future<String> getTeams(String sportCenter) async {
  await _teamService.writeTeamFixtures(sportCenter);
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
