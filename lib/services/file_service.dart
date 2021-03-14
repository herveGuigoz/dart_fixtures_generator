import 'dart:io';

import '../constantes.dart';

abstract class FileService {
  final sb = StringBuffer();

  Future<void> createDirectoryIfNotExist() async {
    final directory = Directory(kOutputsDirectory);

    if (!directory.existsSync()) await directory.create(recursive: true);
  }

  Future<void> save(String filename) async {
    await createDirectoryIfNotExist();

    final file = File('$kOutputsDirectory$filename');

    var sink = file.openWrite();
    sink.write(sb.toString());
    sb.clear();
    await sink.close();

    stdout.writeln('ツ new file => $kOutputsDirectory$filename');
  }

  void write(String string, {int indent = 0}) {
    sb.writeln('${kIndent * indent}$string');
  }
}
