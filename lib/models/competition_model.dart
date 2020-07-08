import 'package:meta/meta.dart';

import 'round_model.dart';

class Competition {
  Competition({
    @required this.name,
    @required this.rounds,
  });

  final String name;
  final List<Round> rounds;

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      name: json['name'],
      rounds: List<Round>.from(json['rounds'].map((x) => Round.fromJson(x))),
    );
  }
}
