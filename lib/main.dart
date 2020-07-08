import 'dart:convert';

import 'package:premiere_league/models/competition_model.dart';
import 'package:premiere_league/network/network.dart';
import 'package:premiere_league/network/network_interface.dart';

import 'constantes.dart';

import 'utils/extensions.dart';

import 'services/yaml_service.dart';
import 'services/tems_service.dart';

final NetworkInterface _network = Network();
final TeamService _teamService = TeamService(_network);
final YamlService _yamlService = YamlService(_teamService);

Future<String> getTeams(
  int startingIndex,
  String sportCenter,
  String createdBy,
  String filename,
) async {
  await _yamlService.writeTeamFixtures(
    startingIndex,
    sportCenter,
    createdBy,
    filename,
  );
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
