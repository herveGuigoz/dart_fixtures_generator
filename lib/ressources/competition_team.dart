import 'package:equatable/equatable.dart';

class CompetitionTeam extends Equatable {
  CompetitionTeam({
    required this.teamId,
    this.ranking = 1,
    required this.victoriesTotal,
    required this.drawsTotal,
    required this.defeatsTotal,
    required this.pointsTotal,
    required this.goalsForTotal,
    required this.goalsAgainstTotal,
    required this.difference,
  });

  final int teamId;
  final int ranking;
  final int victoriesTotal;
  final int drawsTotal;
  final int defeatsTotal;
  final int pointsTotal;
  final int goalsForTotal;
  final int goalsAgainstTotal;
  final int difference;

  String get groupReference => 'A';
  String get competition => 'competition1';
  String get team => '@team$teamId';

  CompetitionTeam copyWith({
    required int ranking,
  }) {
    return CompetitionTeam(
      teamId: teamId,
      ranking: ranking,
      victoriesTotal: victoriesTotal,
      drawsTotal: drawsTotal,
      defeatsTotal: defeatsTotal,
      pointsTotal: pointsTotal,
      goalsForTotal: goalsForTotal,
      goalsAgainstTotal: goalsAgainstTotal,
      difference: difference,
    );
  }

  @override
  List<Object?> get props {
    return [
      teamId,
      ranking,
      victoriesTotal,
      drawsTotal,
      defeatsTotal,
      pointsTotal,
      goalsForTotal,
      goalsAgainstTotal,
      difference,
    ];
  }

  @override
  String toString() {
    return 'CompetitionTeam{teamId: $teamId, ranking: $ranking, wins: $victoriesTotal, draws: $drawsTotal, losses: $defeatsTotal, points: $pointsTotal, goalsForTotal: $goalsForTotal, goalsAgainstTotal: $goalsAgainstTotal}';
  }
}
