import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_option.freezed.dart';
part 'quiz_option.g.dart';

@freezed
class QuizOption with _$QuizOption {
  factory QuizOption({
    required String text,
    required int value,
  }) = _QuizOption;

  factory QuizOption.fromJson(Map<String, dynamic> json) =>
      _$QuizOptionFromJson(json);
}
