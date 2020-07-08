import 'package:meta/meta.dart';

import 'club_model.dart';
import 'team_model.dart';
import 'round_model.dart';

class Competition {
  final String league;
  final String name;
  final List<Round> rounds;

  Competition({
    @required this.league,
    @required this.name,
    @required this.rounds,
  });

  String get expectedStartingAt {
    if (rounds.isEmpty) throw Exception('No games planned for this competiion');

    return rounds[0].matches[0].dateAsString;
  }

  List<ClubModel> get clubs {
    if (rounds.isEmpty) throw Exception('No games planned for this competiion');

    final clubs = <ClubModel>[];

    rounds[0].matches.forEach((e) {
      clubs.add(e.team1);
      clubs.add(e.team2);
    });

    return clubs;
  }

  List<TeamModel> get teams {
    final teams = clubs.map((c) => TeamModel.fromCompetition(c, this)).toList();

    teams.sort((curr, next) => next.pointsTotal.compareTo(curr.pointsTotal));

    return teams;
  }

  factory Competition.fromJson(Map<String, dynamic> json, String league) {
    return Competition(
      league: league,
      name: json['name'],
      rounds: List<Round>.from(json['rounds'].map((x) => Round.fromJson(x))),
    );
  }
}
