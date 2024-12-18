import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostDiagnosticResultResponse extends Equatable {
  final String? message;

  const PostDiagnosticResultResponse({this.message});

  factory PostDiagnosticResultResponse.fromMap(Map<String, dynamic> data) {
    return PostDiagnosticResultResponse(
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostDiagnosticResultResponse].
  factory PostDiagnosticResultResponse.fromJson(String data) {
    return PostDiagnosticResultResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostDiagnosticResultResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  PostDiagnosticResultResponse copyWith({
    String? message,
  }) {
    return PostDiagnosticResultResponse(
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
