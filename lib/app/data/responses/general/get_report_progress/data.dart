import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'report.dart';

class Data extends Equatable {
  final String? studentId;
  final List<Report>? reports;

  const Data({this.studentId, this.reports});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        studentId: data['student_id'] as String?,
        reports: (data['reports'] as List<dynamic>?)
            ?.map((e) => Report.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'student_id': studentId,
        'reports': reports?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    String? studentId,
    List<Report>? reports,
  }) {
    return Data(
      studentId: studentId ?? this.studentId,
      reports: reports ?? this.reports,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [studentId, reports];
}
