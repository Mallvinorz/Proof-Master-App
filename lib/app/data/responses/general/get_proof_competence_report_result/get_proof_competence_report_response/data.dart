import 'dart:convert';

import 'package:collection/collection.dart';

class Data {
  final String? studentId;
  final int? score;
  final DateTime? createdAt;

  const Data({this.studentId, this.score, this.createdAt});

  @override
  String toString() {
    return 'Data(studentId: $studentId, score: $score, createdAt: $createdAt)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        studentId: data['student_id'] as String?,
        score: data['score'] as int?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'student_id': studentId,
        'score': score,
        'created_at': createdAt?.toIso8601String(),
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
    int? score,
    DateTime? createdAt,
  }) {
    return Data(
      studentId: studentId ?? this.studentId,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => studentId.hashCode ^ score.hashCode ^ createdAt.hashCode;
}
