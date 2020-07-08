import 'package:freezed_annotation/freezed_annotation.dart';

import 'competition_model.dart';
import 'club_model.dart';
import 'match_model.dart';

part 'team_model.freezed.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  TeamModel._();
  factory TeamModel({
    @required ClubModel club,
    @required int victoriesTotal,
    @required int drawsTotal,
    @required int defeatsTotal,
    @required int pointsTotal,
    @required int goalsForTotal,
    @required int goalsAgainstTotal,
    @required int difference,
  }) = _TeamModel;

  factory TeamModel.fromCompetition(ClubModel club, Competition competition) {
    final allGames = <Match>[];

    competition.rounds.forEach((round) {
      round.matches.forEach((e) {
        if (e.score1 != null) {
          allGames.add(e);
        }
      });
    });

    final teamGames = allGames
        .where((e) => e.team1.code == club.code || e.team2.code == club.code)
        .toList();

    var win = 0, loss = 0, draw = 0, gf = 0, ga = 0;

    teamGames.forEach((e) {
      if (e.team1.code == club.code) {
        e.score1 > e.score2 ? win++ : e.score1 == e.score2 ? draw++ : loss++;
        gf += e.score1;
        ga += e.score2;
      } else {
        e.score2 > e.score1 ? win++ : e.score1 == e.score2 ? draw++ : loss++;
        gf += e.score2;
        ga += e.score1;
      }
    });

    return TeamModel(
      club: club,
      victoriesTotal: win,
      drawsTotal: draw,
      defeatsTotal: loss,
      pointsTotal: (win * 3) + draw,
      goalsForTotal: gf,
      goalsAgainstTotal: ga,
      difference: gf - ga,
    );
  }
}
