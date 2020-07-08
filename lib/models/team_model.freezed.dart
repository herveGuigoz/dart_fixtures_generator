// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TeamModelTearOff {
  const _$TeamModelTearOff();

  _TeamModel call(
      {@required String league,
      @required ClubModel club,
      @required int victoriesTotal,
      @required int drawsTotal,
      @required int defeatsTotal,
      @required int pointsTotal,
      @required int goalsForTotal,
      @required int goalsAgainstTotal,
      @required int difference}) {
    return _TeamModel(
      league: league,
      club: club,
      victoriesTotal: victoriesTotal,
      drawsTotal: drawsTotal,
      defeatsTotal: defeatsTotal,
      pointsTotal: pointsTotal,
      goalsForTotal: goalsForTotal,
      goalsAgainstTotal: goalsAgainstTotal,
      difference: difference,
    );
  }
}

// ignore: unused_element
const $TeamModel = _$TeamModelTearOff();

mixin _$TeamModel {
  String get league;
  ClubModel get club;
  int get victoriesTotal;
  int get drawsTotal;
  int get defeatsTotal;
  int get pointsTotal;
  int get goalsForTotal;
  int get goalsAgainstTotal;
  int get difference;

  $TeamModelCopyWith<TeamModel> get copyWith;
}

abstract class $TeamModelCopyWith<$Res> {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) then) =
      _$TeamModelCopyWithImpl<$Res>;
  $Res call(
      {String league,
      ClubModel club,
      int victoriesTotal,
      int drawsTotal,
      int defeatsTotal,
      int pointsTotal,
      int goalsForTotal,
      int goalsAgainstTotal,
      int difference});
}

class _$TeamModelCopyWithImpl<$Res> implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._value, this._then);

  final TeamModel _value;
  // ignore: unused_field
  final $Res Function(TeamModel) _then;

  @override
  $Res call({
    Object league = freezed,
    Object club = freezed,
    Object victoriesTotal = freezed,
    Object drawsTotal = freezed,
    Object defeatsTotal = freezed,
    Object pointsTotal = freezed,
    Object goalsForTotal = freezed,
    Object goalsAgainstTotal = freezed,
    Object difference = freezed,
  }) {
    return _then(_value.copyWith(
      league: league == freezed ? _value.league : league as String,
      club: club == freezed ? _value.club : club as ClubModel,
      victoriesTotal: victoriesTotal == freezed
          ? _value.victoriesTotal
          : victoriesTotal as int,
      drawsTotal: drawsTotal == freezed ? _value.drawsTotal : drawsTotal as int,
      defeatsTotal:
          defeatsTotal == freezed ? _value.defeatsTotal : defeatsTotal as int,
      pointsTotal:
          pointsTotal == freezed ? _value.pointsTotal : pointsTotal as int,
      goalsForTotal: goalsForTotal == freezed
          ? _value.goalsForTotal
          : goalsForTotal as int,
      goalsAgainstTotal: goalsAgainstTotal == freezed
          ? _value.goalsAgainstTotal
          : goalsAgainstTotal as int,
      difference: difference == freezed ? _value.difference : difference as int,
    ));
  }
}

abstract class _$TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$TeamModelCopyWith(
          _TeamModel value, $Res Function(_TeamModel) then) =
      __$TeamModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String league,
      ClubModel club,
      int victoriesTotal,
      int drawsTotal,
      int defeatsTotal,
      int pointsTotal,
      int goalsForTotal,
      int goalsAgainstTotal,
      int difference});
}

class __$TeamModelCopyWithImpl<$Res> extends _$TeamModelCopyWithImpl<$Res>
    implements _$TeamModelCopyWith<$Res> {
  __$TeamModelCopyWithImpl(_TeamModel _value, $Res Function(_TeamModel) _then)
      : super(_value, (v) => _then(v as _TeamModel));

  @override
  _TeamModel get _value => super._value as _TeamModel;

  @override
  $Res call({
    Object league = freezed,
    Object club = freezed,
    Object victoriesTotal = freezed,
    Object drawsTotal = freezed,
    Object defeatsTotal = freezed,
    Object pointsTotal = freezed,
    Object goalsForTotal = freezed,
    Object goalsAgainstTotal = freezed,
    Object difference = freezed,
  }) {
    return _then(_TeamModel(
      league: league == freezed ? _value.league : league as String,
      club: club == freezed ? _value.club : club as ClubModel,
      victoriesTotal: victoriesTotal == freezed
          ? _value.victoriesTotal
          : victoriesTotal as int,
      drawsTotal: drawsTotal == freezed ? _value.drawsTotal : drawsTotal as int,
      defeatsTotal:
          defeatsTotal == freezed ? _value.defeatsTotal : defeatsTotal as int,
      pointsTotal:
          pointsTotal == freezed ? _value.pointsTotal : pointsTotal as int,
      goalsForTotal: goalsForTotal == freezed
          ? _value.goalsForTotal
          : goalsForTotal as int,
      goalsAgainstTotal: goalsAgainstTotal == freezed
          ? _value.goalsAgainstTotal
          : goalsAgainstTotal as int,
      difference: difference == freezed ? _value.difference : difference as int,
    ));
  }
}

class _$_TeamModel extends _TeamModel {
  _$_TeamModel(
      {@required this.league,
      @required this.club,
      @required this.victoriesTotal,
      @required this.drawsTotal,
      @required this.defeatsTotal,
      @required this.pointsTotal,
      @required this.goalsForTotal,
      @required this.goalsAgainstTotal,
      @required this.difference})
      : assert(league != null),
        assert(club != null),
        assert(victoriesTotal != null),
        assert(drawsTotal != null),
        assert(defeatsTotal != null),
        assert(pointsTotal != null),
        assert(goalsForTotal != null),
        assert(goalsAgainstTotal != null),
        assert(difference != null),
        super._();

  @override
  final String league;
  @override
  final ClubModel club;
  @override
  final int victoriesTotal;
  @override
  final int drawsTotal;
  @override
  final int defeatsTotal;
  @override
  final int pointsTotal;
  @override
  final int goalsForTotal;
  @override
  final int goalsAgainstTotal;
  @override
  final int difference;

  @override
  String toString() {
    return 'TeamModel(league: $league, club: $club, victoriesTotal: $victoriesTotal, drawsTotal: $drawsTotal, defeatsTotal: $defeatsTotal, pointsTotal: $pointsTotal, goalsForTotal: $goalsForTotal, goalsAgainstTotal: $goalsAgainstTotal, difference: $difference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TeamModel &&
            (identical(other.league, league) ||
                const DeepCollectionEquality().equals(other.league, league)) &&
            (identical(other.club, club) ||
                const DeepCollectionEquality().equals(other.club, club)) &&
            (identical(other.victoriesTotal, victoriesTotal) ||
                const DeepCollectionEquality()
                    .equals(other.victoriesTotal, victoriesTotal)) &&
            (identical(other.drawsTotal, drawsTotal) ||
                const DeepCollectionEquality()
                    .equals(other.drawsTotal, drawsTotal)) &&
            (identical(other.defeatsTotal, defeatsTotal) ||
                const DeepCollectionEquality()
                    .equals(other.defeatsTotal, defeatsTotal)) &&
            (identical(other.pointsTotal, pointsTotal) ||
                const DeepCollectionEquality()
                    .equals(other.pointsTotal, pointsTotal)) &&
            (identical(other.goalsForTotal, goalsForTotal) ||
                const DeepCollectionEquality()
                    .equals(other.goalsForTotal, goalsForTotal)) &&
            (identical(other.goalsAgainstTotal, goalsAgainstTotal) ||
                const DeepCollectionEquality()
                    .equals(other.goalsAgainstTotal, goalsAgainstTotal)) &&
            (identical(other.difference, difference) ||
                const DeepCollectionEquality()
                    .equals(other.difference, difference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(league) ^
      const DeepCollectionEquality().hash(club) ^
      const DeepCollectionEquality().hash(victoriesTotal) ^
      const DeepCollectionEquality().hash(drawsTotal) ^
      const DeepCollectionEquality().hash(defeatsTotal) ^
      const DeepCollectionEquality().hash(pointsTotal) ^
      const DeepCollectionEquality().hash(goalsForTotal) ^
      const DeepCollectionEquality().hash(goalsAgainstTotal) ^
      const DeepCollectionEquality().hash(difference);

  @override
  _$TeamModelCopyWith<_TeamModel> get copyWith =>
      __$TeamModelCopyWithImpl<_TeamModel>(this, _$identity);
}

abstract class _TeamModel extends TeamModel {
  _TeamModel._() : super._();
  factory _TeamModel(
      {@required String league,
      @required ClubModel club,
      @required int victoriesTotal,
      @required int drawsTotal,
      @required int defeatsTotal,
      @required int pointsTotal,
      @required int goalsForTotal,
      @required int goalsAgainstTotal,
      @required int difference}) = _$_TeamModel;

  @override
  String get league;
  @override
  ClubModel get club;
  @override
  int get victoriesTotal;
  @override
  int get drawsTotal;
  @override
  int get defeatsTotal;
  @override
  int get pointsTotal;
  @override
  int get goalsForTotal;
  @override
  int get goalsAgainstTotal;
  @override
  int get difference;
  @override
  _$TeamModelCopyWith<_TeamModel> get copyWith;
}
