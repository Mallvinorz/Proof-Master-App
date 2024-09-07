import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? token;
  final String? role;

  const Data({this.token, this.role});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        token: data['token'] as String?,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'token': token,
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    String? token,
    String? role,
  }) {
    return Data(
      token: token ?? this.token,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [token, role];
}
