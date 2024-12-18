import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class AuthReponse extends Equatable {
  final Data? data;

  const AuthReponse({this.data});

  factory AuthReponse.fromMap(Map<String, dynamic> data) => AuthReponse(
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AuthReponse].
  factory AuthReponse.fromJson(String data) {
    return AuthReponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AuthReponse] to a JSON string.
  String toJson() => json.encode(toMap());

  AuthReponse copyWith({
    Data? data,
  }) {
    return AuthReponse(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [data];
}
