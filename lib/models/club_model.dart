class ClubModel {
  final String key;
  final String name;
  final String code;
  final TeamColors colors;

  ClubModel({this.key, this.name, this.code, this.colors});

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      key: json['key'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      colors: colorsValues.map[json['code']],
    );
  }
}

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
  Map<String, TeamColors> map;
  Map<TeamColors, String> reverseMap;

  EnumValues(this.map);

  Map<TeamColors, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class TeamColors {
  final String primaryColor;
  final String secondaryColor;

  TeamColors(this.primaryColor, this.secondaryColor);
}
