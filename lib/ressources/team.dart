import 'package:equatable/equatable.dart';
import 'package:openfootball_fixtures_yaml/entities/_entities.dart';

class Team extends Equatable {
  const Team({
    required this.name,
    required this.trigram,
    required this.primaryColor,
    required this.secondaryColor,
  });

  factory Team.fromClub(Club club) {
    late Team team;

    switch (club.code) {
      case 'BUR':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#8e0038',
          secondaryColor: '#b6FFFF',
        );
        break;
      case 'MUN':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#c4001d',
          secondaryColor: '#c4001d',
        );
        break;
      case 'MCI':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#bbdefb',
          secondaryColor: '#bbdefb',
        );
        break;
      case 'AVL':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#8e0038',
          secondaryColor: '#bbdefb',
        );
        break;
      case 'FUL':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#000000',
          secondaryColor: '#ffffff',
        );
        break;
      case 'ARS':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#f44336',
          secondaryColor: '#f44336',
        );
        break;
      case 'CRY':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#f44336',
          secondaryColor: '#3949ab',
        );
        break;
      case 'SOU':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#c30000',
          secondaryColor: '#eceff1',
        );
        break;
      case 'LIV':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#c4001d',
          secondaryColor: '#c4001d',
        );
        break;
      case 'LEE':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#ffffff',
          secondaryColor: '#ffffff',
        );
        break;
      case 'WHU':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#560027',
          secondaryColor: '#00b8d4',
        );
        break;
      case 'NEW':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#000000',
          secondaryColor: '#ffffff',
        );
        break;
      case 'WBA':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#000000',
          secondaryColor: '#000000',
        );
        break;
      case 'LEI':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#303f9f',
          secondaryColor: '#303f9f',
        );
        break;
      case 'TOT':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#eceff1',
          secondaryColor: '#eceff1',
        );
        break;
      case 'EVE':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#303f9f',
          secondaryColor: '#303f9f',
        );
        break;
      case 'SHU':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#c30000',
          secondaryColor: '#eceff1',
        );
        break;
      case 'WOL':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#ffab00',
          secondaryColor: '#ffab00',
        );
        break;
      case 'BHA':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#bbdefb',
          secondaryColor: '#fafafa',
        );
        break;
      case 'CHE':
        team = Team(
          name: club.name,
          trigram: club.code,
          primaryColor: '#0d47a1',
          secondaryColor: '#0d47a1',
        );
        break;
      default:
        throw Exception('Team for code ${club.code} not found');
    }

    return team;
  }

  final String name;
  final String trigram;
  final String primaryColor;
  final String secondaryColor;

  String get sportCenter => '@sportCenter1';
  String get createdBy => '@player*';

  @override
  String toString() {
    return 'Team{name: $name, trigram: $trigram}';
  }

  @override
  List<Object> get props => [name, trigram, primaryColor, secondaryColor];
}
