import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:premiere_league/services/tems_service.dart';

class YamlService {
  final TeamService _teamService;

  YamlService(this._teamService);

  String _getPath(String fileName) {
    return p.join(p.dirname(Platform.script.toFilePath()), '$fileName.yaml');
  }

  Future<void> writeTeamFixtures(
    int startingIndex,
    String sportCenter,
    String createdBy,
    String filename,
  ) async {
    final yaml = await _teamService.getYaml(
      startingIndex,
      sportCenter,
      createdBy,
    );

    // final file = File(getPath('team'));
    final file = File('generated/${filename}.yaml');

    var sink = file.openWrite();
    sink.write(yaml);
    await sink.close();
    stdout.writeln('File saved: /generated/$filename.yaml');
  }
}
