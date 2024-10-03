import 'package:proofmaster/app/data/responses/student/post_result_diagnostic_test_response/post_diagnostic_result_response.dart';
import 'package:proofmaster/app/domain/entities/diagnostic_quiz_result_dto/diagnosticquizresultdto.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';

abstract class QuizRepository {
  Future<List<QuizQuestion>> getDiagnosticQuizQuestionsFrom(String id);
  Future<List<QuizQuestion>> getProofCompetenceQuizQuestionsFrom(String id);
  Future<PostDiagnosticResultResponse> postDiagnosticQuizResult(
      String quizId, DiagnosticQuizResultDto dto);
  Future<PostDiagnosticResultResponse> postProofCompetenceResult(
      String quizId, int score);
  void dispose();
}
