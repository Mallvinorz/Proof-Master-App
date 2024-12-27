import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetDiagnosticReportResponse extends Equatable {
  final Data? data;

  const GetDiagnosticReportResponse({this.data});

  factory GetDiagnosticReportResponse.fromMap(Map<String, dynamic> data) {
    return GetDiagnosticReportResponse(
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
  /// Parses the string and returns the resulting Json object as [GetDiagnosticReportResponse].
  factory GetDiagnosticReportResponse.fromJson(String data) {
    return GetDiagnosticReportResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetDiagnosticReportResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetDiagnosticReportResponse copyWith({
    Data? data,
  }) {
    return GetDiagnosticReportResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
