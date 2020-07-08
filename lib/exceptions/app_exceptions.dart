abstract class AppException implements Exception {
  final String error;

  AppException(this.error);

  @override
  String toString() => error;
}

class ServerException extends AppException {
  ServerException(String error) : super(error);
}
