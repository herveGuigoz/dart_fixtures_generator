import 'package:openfootball_fixtures_yaml/repositories/repository.dart';
import 'package:riverpod/riverpod.dart';

import 'file_service.dart';

final teamServiceRef = Provider((ref) => TeamService(ref.read));

class TeamService extends FileService {
  TeamService(this._read);

  final Reader _read;

  Repository get _repository => _read(repositoryRef);

  Future<void> writeTeamFixtures() async {
    final teams = await _repository.getTeams();

    write('include:');
    write('- ./SportCenterFixtures.yaml', indent: 1);
    write('');
    write('App\\Entity\\Team:');

    teams.asMap().forEach((i, team) {
      write('team${i + 1}:', indent: 1);
      write('name: ${team.name}', indent: 2);
      write('trigram: ${team.trigram}', indent: 2);
      write("primaryColor: '${team.primaryColor}'", indent: 2);
      write("secondaryColor: '${team.secondaryColor}'", indent: 2);
      write("sportCenter: '${team.sportCenter}'", indent: 2);
      write("createdBy: '${team.createdBy}'", indent: 2);
      write('');
    });

    await save('TeamFixtures.yaml');
  }

  Future<void> writeCompetitionTeamFixtures() async {
    final teams = await _repository.getCompetitionTeam();

    write('include:');
    write('- ./TeamFixtures.yaml', indent: 1);
    write('- ./CompetitionFixtures.yaml', indent: 1);
    write('');
    write('App\\Entity\\CompetitionTeam:');

    teams.asMap().forEach((index, team) {
      write('${team.competition}Team${index + 1}:', indent: 1);
      write('groupReference: ${team.groupReference}', indent: 2);
      write('ranking: ${team.ranking}', indent: 2);
      write('victoriesTotal: ${team.victoriesTotal}', indent: 2);
      write('drawsTotal: ${team.drawsTotal}', indent: 2);
      write('defeatsTotal: ${team.defeatsTotal}', indent: 2);
      write('pointsTotal: ${team.pointsTotal}', indent: 2);
      write('goalsForTotal: ${team.goalsForTotal}', indent: 2);
      write('goalsAgainstTotal: ${team.goalsAgainstTotal}', indent: 2);
      write('difference: ${team.difference}', indent: 2);
      write("competition: '@${team.competition}'", indent: 2);
      write("team: '${team.team}'", indent: 2);
      write('');
    });

    await save('CompetitionTeamFixtures.yaml');
  }
}
