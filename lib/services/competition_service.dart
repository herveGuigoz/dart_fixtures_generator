import 'package:openfootball_fixtures_yaml/repositories/repository.dart';
import 'package:riverpod/riverpod.dart';

import 'file_service.dart';

final competitionServiceRef = Provider((ref) => CompetitionService(ref.read));

class CompetitionService extends FileService {
  CompetitionService(this.read);

  final Reader read;

  Repository get _repository => read(repositoryRef);

  Future<void> writeCompetitionFixture() async {
    final competition = await _repository.getCompetition();

    write('include:');
    write('- ./SportCenterFixtures.yaml', indent: 1);
    write('- ./FieldFixtures.yaml', indent: 1);
    write('');
    write('App\\Entity\\Competition:');

    write('competition${competition.id}:', indent: 1);
    write("name: '${competition.name}'", indent: 2);
    write('visible: ${competition.visible}', indent: 2);
    write('twoLegged: ${competition.twoLegged}', indent: 2);
    write('expectedStartingAt: ${competition.expectedStartingAt}', indent: 2);
    write("sportCenter: '${competition.sportCenter}'", indent: 2);
    write('');

    await save('CompetitionFixtures.yaml');
  }
}
