

import '../models/team_color.dart';

final colorsValues = EnumValues({
  // EN
  'arsenal': TeamColors('#f44336', '#f5f5f5'),
  'astonvilla': TeamColors('#8e0038', '#bbdefb'),
  'brightonhovealbionfc': TeamColors('#bbdefb', '#fafafa'),
  'bournemouth': TeamColors('#b71c1c', '#263238'),
  'burnley': TeamColors('#8e0038', '#b6ffff'),
  'chelsea': TeamColors('#0d47a1', '#0d47a1'),
  'crystalpalace': TeamColors('#f44336', '#3949ab'),
  'everton': TeamColors('#303f9f', '#303f9f'),
  'leicester': TeamColors('#303f9f', '#303f9f'),
  'liverpool': TeamColors('#c4001d', '#c4001d'),
  'mancity': TeamColors('#bbdefb', '#bbdefb'),
  'manutd': TeamColors('#c4001d', '#c4001d'),
  'newcastle': TeamColors('#000000', '#ffffff'),
  'norwich': TeamColors('#ffff56', '#00b248'),
  'sheffieldunitedfc': TeamColors('#c30000', '#ffffff'),
  'southampton': TeamColors('#c30000', '#ffffff'),
  'tottenham': TeamColors('#ffffff', '#ffffff'),
  'watford': TeamColors('#ffff00', '#212121'),
  'westham': TeamColors('#560027', '#00b8d4'),
  'wolves': TeamColors('#ffab00', '#ffab00'),
  // CH
  'sion': TeamColors('#d32f2f', '#d32f2f'),
  'basel': TeamColors('#d32f2f', '#5c6bc0'),
  'thun': TeamColors('#d32f2f', '#d32f2f'),
  'xamax': TeamColors('#424242', '#d84315'),
  'stgallen': TeamColors('#43a047', '#43a047'),
  'luzern': TeamColors('#3f51b5', '#3f51b5'),
  'youngboys': TeamColors('#fdd835', '#fdd835'),
  'servette': TeamColors('#8e0038', '#8e0038'),
  'zuerich': TeamColors('#eceff1', '#eceff1'),
  'lugano': TeamColors('#212121', '#212121'),
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
