import 'package:equatable/equatable.dart';

import '../network/extensions.dart';

class Match extends Equatable {
  Match({
    required this.round,
    required this.date,
    required this.team1,
    required this.team2,
    this.score,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      round: json.key('round'),
      date: json.parseDate('date'),
      team1: json.key('team1'),
      team2: json.key('team2'),
      score: json['score'] != null
          ? Score.fromJson(json['score'] as Map<String, dynamic>)
          : null,
    );
  }

  final String round;
  final DateTime date;
  final String team1;
  final String team2;
  final Score? score;

  String get roundId => round.lastChars(1);

  String get dateAsString => '${date.toString().substring(0, 10)} 14:00:00';

  bool get played => score != null;

  bool get isHomeWin {
    if (score == null) throw Exception('try to get winner on match not played');
    return score!.home > score!.away;
  }

  bool get isAwayWin {
    if (score == null) throw Exception('try to get winner on match not played');
    return score!.away > score!.home;
  }

  bool get isDraw {
    if (score == null) throw Exception('try to get draw on match not played');
    return score!.away == score!.home;
  }

  int get homeScore {
    if (score == null) throw Exception('try to get score on match not played');
    return score!.home;
  }

  int get awayScore {
    if (score == null) throw Exception('try to get score on match not played');
    return score!.away;
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  String toString() {
    return 'Match{round: $round, team1: $team1, team2: $team2, score: $score}';
  }
}

class Score {
  const Score(this.home, this.away);

  final int home;
  final int away;

  factory Score.fromJson(Map<String, dynamic> json) {
    final array = json['ft'] as List<dynamic>;

    return Score(
      array[0] as int,
      array[1] as int,
    );
  }

  @override
  String toString() {
    return 'Score{home: $home, away: $away}';
  }
}

extension StringExt on String {
  String lastChars(int n) => substring(length - n);
}
