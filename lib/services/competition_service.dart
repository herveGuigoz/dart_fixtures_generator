import 'package:openfootball_fixtures_yaml/models/competition_model.dart';

import '../repositories/fixture_repository.dart';
import 'file_service.dart';

class CompetitionService extends FileService {
  final FixtureRepository _repository;

  CompetitionService(this._repository);

  Future<void> writeCompetitionFixtures(List<String> leagues) async {
    final competitions = await Future.wait(
      leagues.map((e) async => await _repository.getCompetition(e)),
    );

    // header
    write('include:');
    write('- ./SportCenterFixtures.yaml', 1);
    write('- ./FieldFixtures.yaml', 1);
    write('');
    write('App\\Entity\\Competition:');

    competitions.asMap().forEach((i, competition) {
      final competitionId = leagues.indexOf(competition.league) + 1;
      write('competition${competitionId}:', 1);
      write('name: ${competition.name}', 2);
      write('visible: 1', 2);
      write('twoLegged: 1', 2);
      write(
        "expectedStartingAt: <(new DateTime('${competition.expectedStartingAt}'))>",
        2,
      );
      write("sportCenter: '@sportCenter1'", 2);
      write('');
    });

    await save('CompetitionFixtures.yaml');
  }
}
