import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/quiz_repository_impl.dart';
import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/get_quiz_questions_response.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'quiz_provider.g.dart';

@riverpod
QuizRepository quizRepository(QuizRepositoryRef ref) {
  return QuizRepositoryImpl(http.Client());
}

// this will generate a fetchWeatherProvider
@riverpod
Future<GetQuizQuestionsResponse> getQuizQuestionsFrom(
    GetQuizQuestionsFromRef ref, String id) {
  return ref.watch(quizRepositoryProvider).getQuizQuestionsFrom(id);
}
