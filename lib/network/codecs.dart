import 'dart:convert';

abstract class JsonCodec<T> {
  const JsonCodec();

  Map<String, dynamic?> encodeMap(T value);
  T decodeMap(Map<String, dynamic> json);

  String encodeList(List<T> value) {
    return jsonEncode(value.map(encodeMap).toList());
  }

  String encode(T value) {
    return jsonEncode(encodeMap(value));
  }

  T decode(String value) {
    return decodeMap(jsonDecode(value) as Map<String, dynamic>);
  }

  List<T> decodeList(String value) {
    return jsonDecode(value)
        .map((dynamic x) => decodeMap(x as Map<String, dynamic>))
        .toList()
        .cast<T>() as List<T>;
  }
}

Type typeOf<T>() => T;

abstract class JsonCodecInterface {
  const JsonCodecInterface();

  Map<Type, JsonCodec> get codecs;

  String encode<T>(T value) {
    final codec = findCodec<T>();
    return codec.encode(value);
  }

  String encodeList<T>(List<T> value) {
    final codec = findCodec<T>();
    return codec.encodeList(value);
  }

  T decode<T>(dynamic value) {
    final codec = findCodec<T>();
    return codec.decode(value);
  }

  List<T> decodeList<T>(String value) {
    final codec = findCodec<T>();
    return codec.decodeList(value);
  }

  JsonCodec<T> findCodec<T>() {
    if (!codecs.containsKey(typeOf<T>())) {
      print('Codec for type <$T> Not Found');
      throw Exception('Codec for type <$T> Not Found');
    }
    return codecs[typeOf<T>()] as JsonCodec<T>;
  }
}
