import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? studentId;
  final String? type;
  final String? desc;
  final DateTime? createdAt;

  const Data({this.studentId, this.type, this.desc, this.createdAt});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        studentId: data['student_id'] as String?,
        type: data['type'] as String?,
        desc: data['desc'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'student_id': studentId,
        'type': type,
        'desc': desc,
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
    String? type,
    String? desc,
    DateTime? createdAt,
  }) {
    return Data(
      studentId: studentId ?? this.studentId,
      type: type ?? this.type,
      desc: desc ?? this.desc,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [studentId, type, desc, createdAt];
}
