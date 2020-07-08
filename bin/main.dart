import 'package:premiere_league/main.dart' as app;
import 'package:args/args.dart';
import 'dart:io';

ArgResults argResults;

void main(List<String> arguments) async {
  final argParser = ArgParser()
    ..addOption(
      'index',
      abbr: 'i',
      defaultsTo: '1',
      help: 'The starting index.',
    )
    ..addOption(
      'sportCenter',
      abbr: 's',
      defaultsTo: '@sportCenter1',
      help: 'The sport center id field.',
    )
    ..addOption(
      'createdBy',
      abbr: 'c',
      defaultsTo: '@player*',
      help: 'The createdBy field.',
    )
    ..addOption(
      'filename',
      abbr: 'f',
      defaultsTo: 'teams',
      help: 'Output file name.',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Displays help information.',
    );

  argResults = argParser.parse(arguments);

  if (argResults['help']) {
    print('${argParser.usage}');
    return;
  }

  final String index = argResults['index'];
  int indexAsInt;

  try {
    indexAsInt = int.parse(index);
  } catch (_) {
    handleError('Invalid argument: index');
  }

  final sportCenter = argResults['sportCenter'];
  final createdBy = argResults['createdBy'];
  final filename = argResults['filename'];

  await app.getTeams(indexAsInt, sportCenter, createdBy, filename);

  return;
}

void handleError(String msg) {
  stderr.writeln(msg);
  exitCode = 2;
}
