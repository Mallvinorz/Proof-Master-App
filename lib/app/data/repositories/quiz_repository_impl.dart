import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/get_quiz_questions_response.dart';
import 'package:proofmaster/app/domain/entities/quiz_option/quiz_option.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';
  QuizRepositoryImpl(this.client);
  final http.Client client;

  @override
  Future<List<QuizQuestion>> getDiagnosticQuizQuestionsFrom(String id) async {
    try {
      final queries = {'id': id};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
      });
      final result = GetQuizQuestionsResponse.fromJson(response.body);
      if (result.data == null) throw Exception("Data is null!");

      return result.data!
          .map((element) => QuizQuestion(
                id: element.id ?? "-",
                text: element.question ?? "",
                correctAnswerValue: element.actualAnswerValue,
                options: element.answerOptions!
                    .map((option) => QuizOption(
                        text: option.text ?? "-", value: option.value ?? 0))
                    .toList(),
              ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<QuizQuestion>> getProofCompetenceQuizQuestionsFrom(
      String id) async {
    try {
      final queries = {'id': 'a5ad1e61-89f2-4fa2-8c27-05751c7ec366'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
      });
      final result = GetQuizQuestionsResponse.fromJson(response.body);
      if (result.data == null) throw Exception("Data is null!");

      return result.data!
          .map((element) => QuizQuestion(
                id: element.id ?? "-",
                text: element.question ?? "",
                correctAnswerValue: null,
                options: element.answerOptions!
                    .map((option) => QuizOption(
                        text: option.text ?? "-", value: option.value ?? 0))
                    .toList(),
              ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    client.close();
  }

  @override
  Future<void> submitQuiz(String quizId) {
    // TODO: implement submitQuiz
    throw UnimplementedError();
  }
}
