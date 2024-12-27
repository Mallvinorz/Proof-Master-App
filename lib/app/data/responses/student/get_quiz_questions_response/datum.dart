import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'answer_option.dart';

class Datum extends Equatable {
  final String? id;
  final String? question;
  final String? imgUrl;
  final int? actualAnswerValue;
  final List<AnswerOption>? answerOptions;

  const Datum(
      {this.id,
      this.question,
      this.imgUrl,
      this.answerOptions,
      this.actualAnswerValue});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as String?,
        question: data['question'] as String?,
        actualAnswerValue: data['actual_answer_value'] as int?,
        answerOptions: (data['answer_options'] as List<dynamic>?)
            ?.map((e) => AnswerOption.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'question': question,
        'actual_answer_value': actualAnswerValue,
        'img_url': imgUrl,
        'answer_options': answerOptions?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    String? id,
    String? question,
    int? actualAnswerValue,
    List<AnswerOption>? answerOptions,
  }) {
    return Datum(
      id: id ?? this.id,
      question: question ?? this.question,
      actualAnswerValue: actualAnswerValue ?? this.actualAnswerValue,
      answerOptions: answerOptions ?? this.answerOptions,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, question, answerOptions];
}
