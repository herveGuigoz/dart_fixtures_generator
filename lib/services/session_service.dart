import 'package:openfootball_fixtures_yaml/repositories/repository.dart';
import 'package:riverpod/riverpod.dart';

import 'file_service.dart';

final sessionServiceRef = Provider((ref) => SessionService(ref.read));

class SessionService extends FileService {
  SessionService(this._read);

  final Reader _read;

  Repository get _repository => _read(repositoryRef);

  Future<void> writeSessionFixtures() async {
    final sessions = await _repository.findMatches();

    write('include:');
    write('- ./FieldFixtures.yaml', indent: 1);
    write('- ./NgtvSessionTypeFixtures.yaml', indent: 1);
    write('');
    write(r'App\Entity\NgtvSession:');

    sessions.asMap().forEach((index, session) {
      final reference = 'ngtvSession${index + 1}Competition1';
      final date = "<(new DateTime('${session.dateAsString}'))>";

      write('$reference:', indent: 1);
      write("reference (unique): '$reference'", indent: 2);
      write("competition: '@competition1'", indent: 2);
      write('plannedStartedAt: $date', indent: 2);
      write('plannedEndedAt: $date', indent: 2);
      write('actualStartedAt: $date', indent: 2);
      write('actualEndedAt: $date', indent: 2);
      write('competitionRoundId: ${session.roundId}', indent: 2);
      write('competitionStage: group_A', indent: 2);
      // todo event
      // if (session.played && (session.homeScore + session.awayScore > 0)) {
      //   write('events:', 2);
      //   for (var i = 0; i < (session.homeScore + session.awayScore - 1); i++) {
      //     write('$i:', 3);
      //   }
      // }
      write("ngtvSessionType: '@ngtvSessionTypeCompetition'", indent: 2);
      write('');
    });

    await save('NgtvSessionFixtures.yaml');
  }

  Future<void> writeSessionTeamFixtures() async {
    final sessions = await _repository.findMatches();

    write('include:');
    write('- ./TeamFixtures.yaml', indent: 1);
    write('- ./NgtvSessionFixtures.yaml', indent: 1);
    write('');
    write(r'App\Entity\NgtvSessionTeam:');

    sessions.asMap().forEach((index, session) {
      final homeTeamId = _repository.cache!.findTeamIdByName(session.team1);
      final awayTeamId = _repository.cache!.findTeamIdByName(session.team2);

      write('ngtvSession${index + 1}Competition1TeamHome:', indent: 1);
      write('home: true', indent: 2);
      if (session.played) {
        write('score: ${session.homeScore}', indent: 2);
      }
      write("team: '@team$homeTeamId'", indent: 2);
      write("competitionTeam: '@competition1Team$homeTeamId'", indent: 2);
      write("ngtvSession: '@ngtvSession${index + 1}Competition1'", indent: 2);
      write('');

      write('ngtvSession${index + 1}Competition1TeamAway:', indent: 1);
      write('home: false', indent: 2);
      if (session.played) {
        write('score: ${session.awayScore}', indent: 2);
      }
      write("team: '@team$awayTeamId'", indent: 2);
      write("competitionTeam: '@competition1Team$awayTeamId'", indent: 2);
      write("ngtvSession: '@ngtvSession${index + 1}Competition1'", indent: 2);
      write('');
    });

    await save('NgtvSessionTeamFixtures.yaml');
  }
}
