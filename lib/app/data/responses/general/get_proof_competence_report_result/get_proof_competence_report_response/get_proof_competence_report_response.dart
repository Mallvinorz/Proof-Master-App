import 'dart:convert';

import 'package:collection/collection.dart';

import 'data.dart';

class GetProofCompetenceReportResponse {
  final Data? data;

  const GetProofCompetenceReportResponse({this.data});

  @override
  String toString() => 'GetProofCompetenceReportResponse(data: $data)';

  factory GetProofCompetenceReportResponse.fromMap(Map<String, dynamic> data) {
    return GetProofCompetenceReportResponse(
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
  /// Parses the string and returns the resulting Json object as [GetProofCompetenceReportResponse].
  factory GetProofCompetenceReportResponse.fromJson(String data) {
    return GetProofCompetenceReportResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetProofCompetenceReportResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetProofCompetenceReportResponse copyWith({
    Data? data,
  }) {
    return GetProofCompetenceReportResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GetProofCompetenceReportResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => data.hashCode;
}
