import 'package:meta/meta.dart';

import 'club_model.dart';

class Match {
  Match({
    @required this.date,
    @required this.team1,
    @required this.team2,
    @required this.score1,
    @required this.score2,
  });

  final DateTime date;
  final ClubModel team1;
  final ClubModel team2;
  final int score1;
  final int score2;

  String get dateAsString => '${date.toString().substring(0, 10)} 14:00:00';

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      date: DateTime.parse(json['date']),
      team1: ClubModel.fromJson(json['team1']),
      team2: ClubModel.fromJson(json['team2']),
      // ignore: unnecessary_null_in_if_null_operators
      score1: json['score1'] ?? null,
      // ignore: unnecessary_null_in_if_null_operators
      score2: json['score2'] ?? null,
    );
  }
}
