import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/get_quiz_questions_response.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';
  QuizRepositoryImpl(this.client);
  final http.Client client;

  @override
  Future<GetQuizQuestionsResponse> getQuizQuestionsFrom(String id) async {
    try {
      final queries = {'id': '3e2ff29f-d31d-414b-8e4e-37a885255b2b'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
      });
      final result = GetQuizQuestionsResponse.fromJson(response.body);
      print(result.data?.length);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> submitQuiz() {
    // TODO: implement submitQuiz
    throw UnimplementedError();
  }

  @override
  void dispose() {
    client.close();
  }
}
