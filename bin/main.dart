import 'package:epl_fixtures_builder/main.dart' as app;
import 'package:args/args.dart';
import 'dart:io';

ArgResults argResults;

void main(List<String> arguments) async {
  final argParser = ArgParser()
    // todo -l leagues option
    ..addOption(
      'sportCenter',
      defaultsTo: '@sportCenter1',
      help: 'The sport center id field.',
    )
    ..addFlag(
      'help',
      // abbr: 'h',
      negatable: false,
      help: 'Displays help information.',
    );

  argResults = argParser.parse(arguments);

  if (argResults['help']) {
    print('${argParser.usage}');
    return;
  }
  // todo argsParser class in app
  final sportCenter = argResults['sportCenter'];

  // todo call app.main and do the rest in app package
  await app.main(sportCenter);

  return;
}

void handleError(String msg) {
  stderr.writeln(msg);
  exitCode = 2;
}
