import 'package:meta/meta.dart';

import '../main.dart';
import '../utils/mapper.dart' as Mapper;
import 'team_color.dart';

class ClubModel {
  final int id;
  final String key;
  final String name;
  final String code;
  final TeamColors colors;

  ClubModel({
    @required this.id,
    @required this.key,
    @required this.name,
    @required this.code,
    @required this.colors,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    var club = cacheService.getClubFromCache(json['key']);

    if (club != null) return club;

    club = ClubModel(
      id: cacheService.teamId(),
      key: json['key'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      colors: Mapper.colorsValues.map[json['key']],
    );

    cacheService.saveClub(club);

    return club;
  }
}
