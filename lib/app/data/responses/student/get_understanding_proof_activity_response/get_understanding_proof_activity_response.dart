import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetUnderstandingProofActivityResponse extends Equatable {
  final Data? data;

  const GetUnderstandingProofActivityResponse({this.data});

  factory GetUnderstandingProofActivityResponse.fromMap(
      Map<String, dynamic> data) {
    return GetUnderstandingProofActivityResponse(
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetUnderstandingProofActivityResponse].
  factory GetUnderstandingProofActivityResponse.fromJson(String data) {
    return GetUnderstandingProofActivityResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetUnderstandingProofActivityResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetUnderstandingProofActivityResponse copyWith({
    Data? data,
  }) {
    return GetUnderstandingProofActivityResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
