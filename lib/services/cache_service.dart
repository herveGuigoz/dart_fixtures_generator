import '../models/competition_model.dart';
import '../models/club_model.dart';

class CacheService {
  int _teamIdCounter = 0;
  final List<ClubModel> _clubs = [];
  final List<Competition> _competition = [];

  int teamId() {
    _teamIdCounter++;
    return _teamIdCounter;
  }

  ClubModel getClubFromCache(String key) {
    return _clubs.firstWhere((e) => e.key == key, orElse: () => null);
  }

  void saveClub(ClubModel club) {
    _clubs.add(club);
  }

  Competition getCompetition(String league) {
    return _competition.firstWhere(
      (e) => e.league == league,
      orElse: () => null,
    );
  }

  void saveCompetition(Competition competition) {
    _competition.add(competition);
  }
}
