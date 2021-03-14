import 'package:openfootball_fixtures_yaml/main.dart' as app;
import 'package:args/args.dart';
import 'dart:io';

late ArgResults argResults;

void main(List<String> arguments) async {
  final argParser = ArgParser()
    ..addMultiOption(
      'leagues',
      abbr: 'l',
      allowed: ['EN', 'CH'],
      defaultsTo: ['EN'],
      splitCommas: true,
      help: 'The leagues to build fixtures.',
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

  final List<String> leagues = argResults['leagues'];

  final leagueToLowercase = leagues.map((e) => e.toLowerCase()).toList();
  await app.main(leagueToLowercase);

  return;
}

void handleError(String msg) {
  stderr.writeln(msg);
  exitCode = 2;
}
