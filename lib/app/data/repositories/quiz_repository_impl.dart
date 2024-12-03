import 'dart:convert';

import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/get_quiz_questions_response.dart';
import 'package:proofmaster/app/data/responses/student/post_result_diagnostic_test_response/post_diagnostic_result_response.dart';
import 'package:proofmaster/app/domain/entities/diagnostic_quiz_result_dto/diagnosticquizresultdto.dart';
import 'package:proofmaster/app/domain/entities/proof_competence_result_dto/proofcompetenceresultdto.dart';
import 'package:proofmaster/app/domain/entities/quiz_option/quiz_option.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/constanta.dart';

class QuizRepositoryImpl implements QuizRepository {
  @override
  Future<List<QuizQuestion>> getDiagnosticQuizQuestionsFrom(String id) async {
    try {
      final uri = Uri.http(BASEURL, "api/quizzes/diagnostics/$id");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      final result = GetQuizQuestionsResponse.fromJson(response.body);
      if (result.data == null) throw Exception("Data is null!");

      final data = result.data
              ?.map((element) => QuizQuestion(
                    id: element.id ?? "-",
                    text: element.question ?? "",
                    imgUrl: element.imgUrl,
                    correctAnswerValue: element.actualAnswerValue,
                    options: element.answerOptions!
                        .map((option) => QuizOption(
                            text: option.text ?? "-", value: option.value ?? 0))
                        .toList(),
                  ))
              .toList() ??
          [];

      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<QuizQuestion>> getProofCompetenceQuizQuestionsFrom(
      String id) async {
    try {
      final uri = Uri.http(BASEURL, "api/quizzes/competences/$id");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
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
    httpClientWithInterceptor.close();
  }

  @override
  Future<PostDiagnosticResultResponse> postDiagnosticQuizResult(
      String quizId, DiagnosticQuizResultDto dto) async {
    try {
      final url = Uri.http(BASEURL, '/api/quizzes/diagnostics/$quizId');
      final response = await httpClientWithInterceptor.post(
        url,
        headers: <String, String>{
          // 'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(dto.toJson()),
      );
      return PostDiagnosticResultResponse.fromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostDiagnosticResultResponse> postProofCompetenceResult(
      String quizId, int score) async {
    try {
      final proofCompetenceResultDto = ProofCompetenceResultDto(score: score);
      final url = Uri.http(BASEURL, '/api/quizzes/competences/$quizId');
      final response = await httpClientWithInterceptor.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(proofCompetenceResultDto.toJson()),
      );
      return PostDiagnosticResultResponse.fromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
