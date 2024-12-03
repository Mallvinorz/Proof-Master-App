import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';

part 'quiz_dto.freezed.dart';
part 'quiz_dto.g.dart';

@freezed
class QuizDTO with _$QuizDTO {
  factory QuizDTO({
    String? prerequisiteDesc,
    String? prerequisiteImg,
    required List<QuizQuestion> questions,
  }) = _Quiz;

  factory QuizDTO.fromJson(Map<String, dynamic> json) =>
      _$QuizDTOFromJson(json);
}
