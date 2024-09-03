import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetReportProgress extends Equatable {
  final List<Datum>? data;

  const GetReportProgress({this.data});

  factory GetReportProgress.fromResponse(Map<String, dynamic> data) {
    return GetReportProgress(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromResponse(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toResponse() => {
        'data': data?.map((e) => e.toResponse()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetReportProgress].
  factory GetReportProgress.fromJson(String data) {
    return GetReportProgress.fromResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetReportProgress] to a JSON string.
  String toJson() => json.encode(toResponse());

  GetReportProgress copyWith({
    List<Datum>? data,
  }) {
    return GetReportProgress(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
