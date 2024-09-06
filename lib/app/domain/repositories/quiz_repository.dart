import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/get_quiz_questions_response.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';

abstract class QuizRepository {
  Future<List<QuizQuestion>> getQuizQuestionsFrom(String id);
  Future<void> submitQuiz();
  void dispose();
}
