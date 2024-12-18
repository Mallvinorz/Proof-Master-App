import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResetPasswordResponse extends Equatable {
  final String? message;

  const ResetPasswordResponse({this.message});

  factory ResetPasswordResponse.fromMap(Map<String, dynamic> data) {
    return ResetPasswordResponse(
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResetPasswordResponse].
  factory ResetPasswordResponse.fromJson(String data) {
    return ResetPasswordResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResetPasswordResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  ResetPasswordResponse copyWith({
    String? message,
  }) {
    return ResetPasswordResponse(
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
