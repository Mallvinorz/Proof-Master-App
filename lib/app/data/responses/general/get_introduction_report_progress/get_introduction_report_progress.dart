import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetIntroductionReportProgress extends Equatable {
  final Data? data;

  const GetIntroductionReportProgress({this.data});

  factory GetIntroductionReportProgress.fromMap(Map<String, dynamic> data) {
    return GetIntroductionReportProgress(
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
  /// Parses the string and returns the resulting Json object as [GetIntroductionReportProgress].
  factory GetIntroductionReportProgress.fromJson(String data) {
    return GetIntroductionReportProgress.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetIntroductionReportProgress] to a JSON string.
  String toJson() => json.encode(toMap());

  GetIntroductionReportProgress copyWith({
    Data? data,
  }) {
    return GetIntroductionReportProgress(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
