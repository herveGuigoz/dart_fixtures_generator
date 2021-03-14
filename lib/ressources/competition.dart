class Competition {
  Competition({
    required this.id,
    required this.name,
    required this.date,
  });

  final int id;
  final String name;
  final DateTime date;

  int get visible => 1;
  int get twoLegged => 1;
  String get sportCenter => '@sportCenter1';
  String get expectedStartingAt => "<(new DateTime('${date.toLocal()}'))>";

  @override
  String toString() {
    return 'Competition{name: $name, date: $expectedStartingAt';
  }
}
