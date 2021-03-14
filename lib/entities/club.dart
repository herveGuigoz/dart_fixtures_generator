import 'package:equatable/equatable.dart';

import '../network/extensions.dart';

class Club extends Equatable {
  Club({
    required this.name,
    required this.code,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(name: json.key('name'), code: json.key('code'));
  }

  final String name;
  final String code;

  @override
  List<Object?> get props => [name, code];

  @override
  String toString() {
    return 'Club{name: $name, code: $code}';
  }
}
