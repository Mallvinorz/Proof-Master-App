import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';

abstract class QuizRepository {
  Future<List<QuizQuestion>> getQuizQuestionsFrom(String id);
  Future<void> submitQuiz();
  void dispose();
}
