import 'dart:convert';

import 'package:equatable/equatable.dart';

class AnswerOption extends Equatable {
  final String? text;
  final int? value;

  const AnswerOption({this.text, this.value});

  factory AnswerOption.fromMap(Map<String, dynamic> data) => AnswerOption(
        text: data['text'] as String?,
        value: data['value'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnswerOption].
  factory AnswerOption.fromJson(String data) {
    return AnswerOption.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnswerOption] to a JSON string.
  String toJson() => json.encode(toMap());

  AnswerOption copyWith({
    String? text,
    int? value,
  }) {
    return AnswerOption(
      text: text ?? this.text,
      value: value ?? this.value,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [text, value];
}
