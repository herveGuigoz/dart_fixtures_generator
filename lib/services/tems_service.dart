import '../repositories/fixture_repository.dart';
import 'file_service.dart';
import '../models/team_model.dart';

class TeamService extends FileService {
  final FixtureRepository _repository;

  TeamService(this._repository);

  Future<void> writeTeamFixtures(List<String> leagues) async {
    final list = await Future.wait(
      leagues.map((e) => _repository.getTeamsCollection(e)),
    );

    final teams = list.expand((x) => x).toList();

    write('include:');
    write('- ./SportCenterFixtures.yaml', 1);
    write('');
    write('App\\Entity\\Team:');

    teams.asMap().forEach((i, team) {
      write('team${team.club.id}:', 1);
      write('name: ${team.club.name}', 2);
      write("primaryColor: '${team.club.colors.primaryColor}'", 2);
      write("secondaryColor: '${team.club.colors.secondaryColor}'", 2);
      write("sportCenter: '@sportCenter1'", 2);
      write("createdBy: '@player*'", 2);
      write('');
    });

    await save('TeamFixtures.yaml');

    await writeCompetitionTeamFixtures(teams, leagues);
  }

  Future<void> writeCompetitionTeamFixtures(
    List<TeamModel> teams,
    List<String> leagues,
  ) async {
    write('include:');
    write('- ./TeamFixtures.yaml', 1);
    write('- ./CompetitionFixtures.yaml', 1);
    write('');
    write('App\\Entity\\CompetitionTeam:');

    final listOfTeamList =
        leagues.map((l) => teams.where((t) => t.league == l).toList()).toList();

    // build ranking
    listOfTeamList.forEach((l) {
      l.sort((curr, next) => next.pointsTotal.compareTo(curr.pointsTotal));
    });

    listOfTeamList.asMap().forEach((cindex, teams) {
      teams.asMap().forEach((i, team) {
        write('competition${cindex + 1}Team${team.club.id}:', 1);
        write('groupReference: A', 2);
        write('ranking: ${i + 1}', 2);
        write('victoriesTotal: ${team.victoriesTotal}', 2);
        write('drawsTotal: ${team.drawsTotal}', 2);
        write('defeatsTotal: ${team.defeatsTotal}', 2);
        write('pointsTotal: ${team.pointsTotal}', 2);
        write('goalsForTotal: ${team.goalsForTotal}', 2);
        write('goalsAgainstTotal: ${team.goalsAgainstTotal}', 2);
        write('difference: ${team.difference}', 2);

        write("competition: '@competition${cindex + 1}'", 2);
        write("team: '@team${team.club.id}'", 2);
        write('');
      });
    });

    await save('CompetitionTeamFixtures.yaml');
  }
}
