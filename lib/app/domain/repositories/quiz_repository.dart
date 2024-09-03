import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/get_quiz_questions_response.dart';

abstract class QuizRepository {
  Future<GetQuizQuestionsResponse> getQuizQuestionsFrom(String id);
  Future<void> submitQuiz();
  void dispose();
}
