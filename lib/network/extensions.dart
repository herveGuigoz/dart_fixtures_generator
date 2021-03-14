import 'codecs.dart';

extension DateTimeToJson on DateTime {
  String toJson() => toIso8601String();
}

extension MapParser on Map<String, dynamic> {
  T? keyOrNull<T>(
    String key, {
    JsonCodec<T>? codec,
    T? defaultTo,
  }) {
    T? response;

    try {
      final value = this[key] != null ? this[key] as Object : null;

      response = value != null
          ? codec == null
              ? value as T
              : codec.decodeMap(value as Map<String, dynamic>)
          : defaultTo;
    } catch (error) {
      throw Exception('Error when serializing $key from $this');
    }

    return response;
  }

  T key<T>(
    String key, {
    JsonCodec<T>? codec,
  }) {
    late T response;

    try {
      final value = this[key] as Object;

      response = codec == null
          ? value as T
          : codec.decodeMap(value as Map<String, dynamic>);
    } catch (error) {
      throw Exception(
        'Error when serializing $key. $key must not be Null',
      );
    }

    return response;
  }

  List<T> parseIterable<T>(
    String key, {
    required JsonCodec<T> codec,
  }) {
    late List<T> response;

    try {
      final value = this[key] != null ? this[key] as List<dynamic> : null;

      response = value != null
          ? List<T>.from(
              (value).map<T>(
                (dynamic e) => codec.decodeMap(e as Map<String, dynamic>),
              ),
              growable: false,
            )
          : <T>[];
    } catch (error) {
      throw Exception('Error when serializing $key from $this');
    }

    return response;
  }

  DateTime parseDate(String key) {
    late DateTime response;

    try {
      final value = this[key] as String;
      response = DateTime.parse(value).toLocal();
    } catch (error) {
      throw Exception('Error when serializing DateTime:${this[key]}');
    }

    return response;
  }
}
