import 'package:openfootball_fixtures_yaml/models/competition_model.dart';
import 'package:openfootball_fixtures_yaml/models/round_model.dart';

import '../repositories/fixture_repository.dart';
import 'file_service.dart';

class MatchService extends FileService {
  final FixtureRepository _repository;

  MatchService(this._repository);

  Future<void> writeCompetitionMatchFixtures(List<String> leagues) async {

    final competitions = await Future.wait(
      leagues.map((e) => _repository.getCompetition(e)),
    ); 

    write('include:');
    write('- ./CompetitionTeamFixtures.yaml', 1);
    write('- ./PlayerTeamFixtures.yaml', 1);
    write('');
    write('App\\Entity\\CompetitionMatch:');

    var matchIndex = 1;

    // todo: refactor 3 foreach :()
    competitions.asMap().forEach((competitionId, competition) {
      competition.rounds.asMap().forEach((roundIndex, round) {
        round.matches.forEach((m) {
          write('competition${competitionId + 1}Match$matchIndex:', 1);
          write("competition: '@competition${competitionId + 1}'", 2);
          write(
            "homeCompetitionTeam: '@competition${competitionId + 1}Team${m.team1.id}'",
            2,
          );
          write(
            "awayCompetitionTeam: '@competition${competitionId + 1}Team${m.team2.id}'",
            2,
          );
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
    });

    await save('CompetitionMatchFixtures.yaml');
  }
}
