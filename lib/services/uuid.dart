import 'package:riverpod/riverpod.dart';

final uuidRef = Provider((ref) => UuidService());

class UuidService {
  int _teamsId = 0;
  int _competitionId = 0;
  int _sessionId = 0;

  int get teamId {
    _teamsId++;
    return _teamsId;
  }

  int get competitionId {
    _competitionId++;
    return _competitionId;
  }

  int get sessionId {
    _sessionId++;
    return _sessionId;
  }
}
