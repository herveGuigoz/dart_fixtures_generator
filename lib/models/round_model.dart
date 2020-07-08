import 'package:meta/meta.dart';

import 'match_model.dart';

class Round {
  Round({
    @required this.name,
    @required this.matches,
  });

  final String name;
  final List<Match> matches;

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      name: json['name'],
      matches: List<Match>.from(json['matches'].map((x) => Match.fromJson(x))),
    );
  }
}
