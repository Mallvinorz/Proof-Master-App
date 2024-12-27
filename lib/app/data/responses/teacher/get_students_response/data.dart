import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'student.dart';

class Data extends Equatable {
  final List<Student>? students;

  const Data({this.students});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        students: (data['students'] as List<dynamic>?)
            ?.map((e) => Student.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'students': students?.map((e) => e.toMap()).toList(),
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
    List<Student>? students,
  }) {
    return Data(
      students: students ?? this.students,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [students];

  where(bool Function(dynamic student) param0) {}
}
