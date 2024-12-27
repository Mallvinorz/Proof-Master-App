import 'dart:convert';

import 'package:equatable/equatable.dart';

class UpdatePfpResponse extends Equatable {
  final String? message;

  const UpdatePfpResponse({this.message});

  factory UpdatePfpResponse.fromMap(Map<String, dynamic> data) {
    return UpdatePfpResponse(
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UpdatePfpResponse].
  factory UpdatePfpResponse.fromJson(String data) {
    return UpdatePfpResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UpdatePfpResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  UpdatePfpResponse copyWith({
    String? message,
  }) {
    return UpdatePfpResponse(
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
