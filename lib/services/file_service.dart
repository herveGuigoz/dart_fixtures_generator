import 'dart:io';

import '../constantes.dart';
// import 'package:path/path.dart' as p;

abstract class FileService {
  // String getPath(String fileName) {
  //   return p.join(p.dirname(Platform.script.toFilePath()), '$fileName.yaml');
  // }

  final sb = StringBuffer();

  Future<void> save(String filename) async {
    final file = File('generated/$filename');

    var sink = file.openWrite();
    sink.write(sb.toString());
    sb.clear();
    await sink.close();

    stdout.writeln('ƪ(ړײ)‎ƪ​​ $filename');
  }

  void write(String string, [int x = 0]) {
    sb.writeln('${kIndent * x}$string');
  }

  void indent(String string, [int x = 1]) {
    sb.writeln('${kIndent * x}$string');
  }
}
