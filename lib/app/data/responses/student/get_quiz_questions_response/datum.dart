import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'answer_option.dart';

class Datum extends Equatable {
  final String? id;
  final String? question;
  final List<AnswerOption>? answerOptions;

  const Datum({this.id, this.question, this.answerOptions});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as String?,
        question: data['question'] as String?,
        answerOptions: (data['answer_options'] as List<dynamic>?)
            ?.map((e) => AnswerOption.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'question': question,
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
    List<AnswerOption>? answerOptions,
  }) {
    return Datum(
      id: id ?? this.id,
      question: question ?? this.question,
      answerOptions: answerOptions ?? this.answerOptions,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, question, answerOptions];
}
