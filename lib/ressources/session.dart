class Session {
  Session({
    required this.reference,
    required this.competition,
    required this.competitionRoundId,
  });

  /// ex: ngtvSession1Competition1
  final String reference;

  /// ex: @competition1
  final String competition;

  /// ex: 1
  final int competitionRoundId;

  String get plannedStartedAt => '<dateTimeThisYear()>';

  String get plannedEndedAt => '<dateTimeThisYear()>';

  String get actualStartedAt => '<dateTimeThisYear()>';

  String get actualEndedAt => '<dateTimeThisYear()>';

  String get competitionStage => 'group_A';

  String get ngtvSessionType => '@ngtvSessionTypeCompetition';
}
