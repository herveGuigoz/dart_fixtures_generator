import 'dart:io';
import 'dart:convert';

import '../network/network_interface.dart';
import '../models/club_model.dart';
import '../constantes.dart';

class TeamService {
  final NetworkInterface _client;

  TeamService(this._client);

  Future<List<ClubModel>> _getCollection() async {
    final response = await _client.get(kTeamsURL);

    final asList = json.decode(response) as Map<String, dynamic>;

    return (asList['clubs'] as List<dynamic>)
        .map((e) => ClubModel.fromJson(e))
        .toList();
  }

  Future<String> getYaml(
    int startingIndex,
    String sportCenter,
    String createdBy,
  ) async {
    final clubs = await _getCollection();
    stdout.writeln('Teams collection fetched');

    final sb = StringBuffer();

    var index = startingIndex ?? 1;

    sb.writeln('include:');
    sb.writeln('    - ./SportCenterFixtures.yaml');
    sb.writeln();
    sb.writeln('App\Entity\Team:');

    for (var club in clubs) {
      sb.writeln('${kIndent}team${index}:');
      sb.writeln('${kIndent * 2}name: ${club.name}');
      sb.writeln(
        "${kIndent * 2}primaryColor: '${club.colors.primaryColor}'",
      );
      sb.writeln(
        "${kIndent * 2}secondaryColor: '${club.colors.secondaryColor}'",
      );
      sb.writeln("${kIndent * 2}sportCenter: '${sportCenter}'");
      sb.writeln("${kIndent * 2}createdBy: '@player*'");

      index++;
    }

    return sb.toString();
  }
}
