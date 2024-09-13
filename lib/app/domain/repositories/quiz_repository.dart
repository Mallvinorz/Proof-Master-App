import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';

abstract class QuizRepository {
  Future<List<QuizQuestion>> getDiagnosticQuizQuestionsFrom(String id);
  Future<List<QuizQuestion>> getProofCompetenceQuizQuestionsFrom(String id);
  Future<void> submitQuiz(String quizId);
  void dispose();
}
