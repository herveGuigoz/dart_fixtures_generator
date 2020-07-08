import '../repositories/fixture_repository.dart';
import 'file_service.dart';

class CompetitionService extends FileService {
  final FixtureRepository _repository;

  CompetitionService(this._repository);

  Future<void> writeCompetitionFixtures(String sportCenter) async {
    final competition = await _repository.getCompetition();

    write('include:');
    write('- ./SportCenterFixtures.yaml', 1);
    write('- ./FieldFixtures.yaml', 1);
    write('');
    write('App\\Entity\\Competition:');
    write('competition1:', 1);
    write('name: ${competition.name}', 2);
    write(
      "expectedStartingAt: <(new DateTime('${competition.expectedStartingAt}'))>",
      2,
    );
    write("sportCenter: '@sportCenter1'", 2);
    write('');

    await save('CompetitionFixtures.yaml');
  }
}
