import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proofmaster/app/domain/entities/quiz_option/quiz_option.dart';

part 'quiz_question.freezed.dart';
part 'quiz_question.g.dart';

@freezed
class QuizQuestion with _$QuizQuestion {
  factory QuizQuestion({
    required String id,
    required String text,
    required List<QuizOption> options,
    int? selectedAnsweValue,
    int? correctAnswerValue,
    String? imgUrl,
    bool? marked,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}
