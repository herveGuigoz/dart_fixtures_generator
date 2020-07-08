import 'dart:io';
import 'dart:convert';

import 'filie_service.dart';
import '../network/network_interface.dart';
import '../models/club_model.dart';
import '../constantes.dart';

class TeamService extends FileService {
  final NetworkInterface _client;

  TeamService(this._client);

  Future<List<ClubModel>> _getCollection() async {
    final response = await _client.get(kTeamsURL);

    final asList = json.decode(response) as Map<String, dynamic>;

    return (asList['clubs'] as List<dynamic>)
        .map((e) => ClubModel.fromJson(e))
        .toList();
  }

  Future<void> writeTeamFixtures(String sportCenter) async {
    final clubs = await _getCollection();

    write('include:');
    indent('- ./SportCenterFixtures.yaml', 1);
    write('');
    write('App\Entity\Team:');

    clubs.asMap().forEach((i, club) {
      write('team${i + 1}:', 1);
      write('name: ${club.name}', 2);
      write("primaryColor: '${club.colors.primaryColor}'", 2);
      write("secondaryColor: '${club.colors.secondaryColor}'", 2);
      write("sportCenter: '${sportCenter}'", 2);
      write("createdBy: '@player*'", 2);
      write('');
    });

    await save('TeamFixtures.yaml');

    await writeCompetitionTeamFixtures(clubs);
  }

  // TODO get teams stats
  Future<void> writeCompetitionTeamFixtures(List<ClubModel> clubs) async {
    write('include:');
    write('- ./TeamFixtures.yaml', 1);
    write('- ./CompetitionFixtures.yaml', 1);
    write('');
    write('App\Entity\CompetitionTeam:');

    clubs.asMap().forEach((i, club) {
      write('competition1Team${i + 1}:', 1);
      write('groupReference: A', 2);
      write("competition: '@competition1'", 2);
      write("team: '@team${i + 1}'", 2);
      write('');
    });

    await save('CompetitionTeamFixtures.yaml');
  }
}
