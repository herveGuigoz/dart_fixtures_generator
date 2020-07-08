abstract class NetworkInterface {
  Future<String> get(String path, {Map<String, String> params});

  Future<String> post(String path, {String body});
}
