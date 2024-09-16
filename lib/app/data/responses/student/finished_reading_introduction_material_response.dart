import 'dart:convert';

import 'package:equatable/equatable.dart';

class FinishedReadingIntroductionMaterialResponse extends Equatable {
  final String? message;

  const FinishedReadingIntroductionMaterialResponse({this.message});

  factory FinishedReadingIntroductionMaterialResponse.fromMap(
      Map<String, dynamic> data) {
    return FinishedReadingIntroductionMaterialResponse(
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FinishedReadingIntroductionMaterialResponse].
  factory FinishedReadingIntroductionMaterialResponse.fromJson(String data) {
    return FinishedReadingIntroductionMaterialResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FinishedReadingIntroductionMaterialResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  FinishedReadingIntroductionMaterialResponse copyWith({
    String? message,
  }) {
    return FinishedReadingIntroductionMaterialResponse(
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
