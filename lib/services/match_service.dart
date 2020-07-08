import '../repositories/fixture_repository.dart';
import 'file_service.dart';

class MatchService extends FileService {
  final FixtureRepository _repository;

  MatchService(this._repository);

  Future<void> writeCompetitionMatchFixtures() async {
    final rounds = await _repository.getRounds();

    write('include:');
    write('- ./CompetitionTeamFixtures.yaml', 1);
    write('- ./PlayerTeamFixtures.yaml', 1);
    write('');
    write('App\\Entity\\CompetitionMatch:');

    var matchIndex = 1;

    rounds.asMap().forEach((roundIndex, round) {
      round.matches.forEach((m) {
        write('competition1Match$matchIndex:', 1);
        write("competition: '@competition1'", 2);
        write("homeCompetitionTeam: '@competition1Team${m.team1.id}'", 2);
        write("awayCompetitionTeam: '@competition1Team${m.team2.id}'", 2);
        write("datetime: <(new DateTime('${m.date}'))>", 2);
        write('roundId: ${roundIndex + 1}', 2);
        write('played: ${m.score1 != null ? 1 : 0}', 2);
        write('stage: group_A', 2);

        if (m.score1 != null) {
          write('homeScore: ${m.score1}', 2);
        }

        if (m.score2 != null) {
          write('awayScore: ${m.score2}', 2);
        }

        write('');
        matchIndex++;
      });
    });

    await save('CompetitionMatchFixtures.yaml');
  }
}
