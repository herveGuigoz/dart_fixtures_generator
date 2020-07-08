import 'package:meta/meta.dart';

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
    return ClubModel(
      id: idsValues.map[json['code']],
      key: json['key'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      colors: colorsValues.map[json['code']],
    );
  }
}

final idsValues = EnumValues({
    'ARS': 1,
    'AVL': 2,
    'BHA': 3,
    'BOU': 4,
    'BUR': 5,
    'CHE': 6,
    'CRY': 7,
    'EVE': 8,
    'LEI': 9,
    'LIV': 10,
    'MCI': 11,
    'MUN': 12,
    'NEW': 13,
    'NOR': 14,
    'SHU': 15,
    'SOU': 16,
    'TOT': 17,
    'WAT': 18,
    'WHU': 19,
    'WOL': 20,
});

final colorsValues = EnumValues({
  'ARS': TeamColors('#f44336', '#f5f5f5'),
  'AVL': TeamColors('#8e0038', '#bbdefb'),
  'BHA': TeamColors('#bbdefb', '#fafafa'),
  'BOU': TeamColors('#b71c1c', '#263238'),
  'BUR': TeamColors('#8e0038', '#b6ffff'),
  'CHE': TeamColors('#0d47a1', '#0d47a1'),
  'CRY': TeamColors('#f44336', '#3949ab'),
  'EVE': TeamColors('#303f9f', '#303f9f'),
  'LEI': TeamColors('#303f9f', '#303f9f'),
  'LIV': TeamColors('#c4001d', '#c4001d'),
  'MCI': TeamColors('#bbdefb', '#bbdefb'),
  'MUN': TeamColors('#c4001d', '#c4001d'),
  'NEW': TeamColors('#000000', '#ffffff'),
  'NOR': TeamColors('#ffff56', '#00b248'),
  'SHU': TeamColors('#c30000', '#ffffff'),
  'SOU': TeamColors('#c30000', '#ffffff'),
  'TOT': TeamColors('#ffffff', '#ffffff'),
  'WAT': TeamColors('#ffff00', '#212121'),
  'WHU': TeamColors('#560027', '#00b8d4'),
  'WOL': TeamColors('#ffab00', '#ffab00')
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class TeamColors {
  final String primaryColor;
  final String secondaryColor;

  TeamColors(this.primaryColor, this.secondaryColor);
}
