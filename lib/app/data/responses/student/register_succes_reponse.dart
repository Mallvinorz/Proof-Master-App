import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterSuccesReponse extends Equatable {
  final String? message;

  const RegisterSuccesReponse({this.message});

  factory RegisterSuccesReponse.fromMap(Map<String, dynamic> data) {
    return RegisterSuccesReponse(
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterSuccesReponse].
  factory RegisterSuccesReponse.fromJson(String data) {
    return RegisterSuccesReponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterSuccesReponse] to a JSON string.
  String toJson() => json.encode(toMap());

  RegisterSuccesReponse copyWith({
    String? message,
  }) {
    return RegisterSuccesReponse(
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
