import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetReportProgress extends Equatable {
  final Data? data;

  const GetReportProgress({this.data});

  factory GetReportProgress.fromMap(Map<String, dynamic> data) {
    return GetReportProgress(
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
  /// Parses the string and returns the resulting Json object as [GetReportProgress].
  factory GetReportProgress.fromJson(String data) {
    return GetReportProgress.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetReportProgress] to a JSON string.
  String toJson() => json.encode(toMap());

  GetReportProgress copyWith({
    Data? data,
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
