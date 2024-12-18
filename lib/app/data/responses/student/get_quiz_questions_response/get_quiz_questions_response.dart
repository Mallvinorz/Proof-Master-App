import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/prerequisite.dart';

import 'datum.dart';

class GetQuizQuestionsResponse extends Equatable {
  final List<Datum>? data;
  final Prerequisite? prerequisite;

  const GetQuizQuestionsResponse({this.data, this.prerequisite});

  factory GetQuizQuestionsResponse.fromMap(Map<String, dynamic> data) {
    return GetQuizQuestionsResponse(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
      prerequisite: data['prerequisite'] == null
          ? null
          : Prerequisite.fromMap(data['prerequisite']),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
        'prerequisite': prerequisite?.toMap()
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetQuizQuestionsResponse].
  factory GetQuizQuestionsResponse.fromJson(String data) {
    return GetQuizQuestionsResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetQuizQuestionsResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetQuizQuestionsResponse copyWith(
      {List<Datum>? data, Prerequisite? prerequisite}) {
    return GetQuizQuestionsResponse(
        data: data ?? this.data,
        prerequisite: prerequisite ?? this.prerequisite);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
