import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetLearningMaterialProgressReportResponse extends Equatable {
  final Data? data;

  const GetLearningMaterialProgressReportResponse({this.data});

  factory GetLearningMaterialProgressReportResponse.fromMap(
      Map<String, dynamic> data) {
    return GetLearningMaterialProgressReportResponse(
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
  /// Parses the string and returns the resulting Json object as [GetLearningMaterialProgressReportResponse].
  factory GetLearningMaterialProgressReportResponse.fromJson(String data) {
    return GetLearningMaterialProgressReportResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetLearningMaterialProgressReportResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetLearningMaterialProgressReportResponse copyWith({
    Data? data,
  }) {
    return GetLearningMaterialProgressReportResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
