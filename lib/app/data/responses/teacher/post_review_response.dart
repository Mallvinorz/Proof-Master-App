import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostReviewResponse extends Equatable {
  final String? data;
  final String? message;

  const PostReviewResponse({this.data, this.message});

  factory PostReviewResponse.fromMap(Map<String, dynamic> data) {
    return PostReviewResponse(
      data: data['data'] as String?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostReviewResponse].
  factory PostReviewResponse.fromJson(String data) {
    return PostReviewResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostReviewResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  PostReviewResponse copyWith({
    String? data,
    String? message,
  }) {
    return PostReviewResponse(
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, message];
}
