import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:proofmaster/app/data/responses/student/get_activities_understading_proof/get_activities_understading_proof.dart';
import 'package:proofmaster/app/data/responses/student/get_understanding_proof_activity_response/get_understanding_proof_activity_response.dart';
import 'package:proofmaster/app/data/responses/student/post_file_activity_response/upload_file_activity_response/upload_file_activity_response.dart';
import 'package:proofmaster/app/data/responses/teacher/get_answered_activity_from_student_response/get_answered_activity_from_student_response.dart';
import 'package:proofmaster/app/data/responses/teacher/get_student_answered_activities_response/get_student_answered_activities_response.dart';
import 'package:proofmaster/app/data/responses/teacher/post_review_response.dart';
import 'package:proofmaster/app/domain/entities/activity_review_dto/activityreviewdto.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/domain/entities/post_understanding_proof_answer_dto/postunderstandingproofanswedto.dart';
import 'package:proofmaster/app/domain/repositories/activity_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/app/helper/interceptor.dart';
import 'package:proofmaster/constanta.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  @override
  Future<UploadFileActivityResponse> uploadFile(
      PostUnderstandingProofAnsweDto dto) async {
    try {
      final url =
          Uri.http(BASEURL, "api/activities/submission/${dto.activityId}");
      // Create a custom client with our interceptor
      final client = InterceptedClient.build(interceptors: [AuthInterceptor()]);

      final request = http.MultipartRequest('POST', url);
      Map<String, String> requestBody = <String, String>{};

      final filename =
          "student-answer-actvity-${dto.activityId}-${DateTime.now()}.pdf";
      request.files.add(http.MultipartFile(
        'file',
        dto.pdfFile.readAsBytes().asStream(),
        dto.pdfFile.lengthSync(),
        filename: filename,
      ));
      request.fields.addAll(requestBody);

      final streamedResponse = await client.send(request);
      var response = await http.Response.fromStream(streamedResponse);

      Fimber.d("response from repository $response");

      if (response.statusCode == 200) {
        final result = UploadFileActivityResponse.fromJson(response.body);
        return result;
      } else {
        throw Exception(
            'Failed to upload file and register. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Fimber.e("response from repository $e");
      rethrow;
    }
  }

  @override
  Future<List<ListItem>> getActivities() async {
    try {
      final uri = Uri.http(BASEURL, "api/activities");

      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final result = GetActivitiesUnderstadingProof.fromJson(response.body);

      return result.data?.activities
              ?.map((activty) => ListItem(
                  id: activty.id ?? "-",
                  text: activty.title ?? "-",
                  iconUrl: "assets/icons/todo_ic.png"))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostReviewResponse> postReviewActivity(ActivityReviewDto dto) async {
    try {
      final url = Uri.http(BASEURL, 'api/activities/review/${dto.activityId}');
      final response = await httpClientWithInterceptor.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: json.encode(dto.toJson()),
      );

      if (response.statusCode != 200) throw Exception(response.body);
      final result = PostReviewResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetUnderstandingProofActivityResponse> getActivity(
      String activityId) async {
    try {
      final uri = Uri.http(BASEURL, "api/activities/$activityId");

      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final result =
          GetUnderstandingProofActivityResponse.fromJson(response.body);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ListItem>> getStudentAnsweredActivities(String studentId) async {
    try {
      final uri = Uri.http(BASEURL, "api/activities/students/$studentId");

      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      final result =
          GetStudentAnsweredActivitiesResponse.fromJson(response.body);
      Fimber.d("student activity report $result");
      return result.data
              ?.map((activty) => ListItem(
                  id: activty.id ?? "-",
                  text: activty.title ?? "-",
                  iconUrl: "assets/icons/todo_ic.png"))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetAnsweredActivityFromStudentResponse> getStudentAnsweredActivity(
      String activityId) async {
    try {
      final uri =
          Uri.http(BASEURL, "api/activities/students/answered/$activityId");

      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      final result =
          GetAnsweredActivityFromStudentResponse.fromJson(response.body);
      Fimber.d("$result");
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ListItem>> getStudentAnsweredActivitiesFromStudent() async {
    try {
      final uri = Uri.http(BASEURL, "api/users/activities");

      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      final result =
          GetStudentAnsweredActivitiesResponse.fromJson(response.body);
      Fimber.d("student activity report $result");
      return result.data
              ?.map((activty) => ListItem(
                  id: activty.id ?? "-",
                  text: activty.title ?? "-",
                  iconUrl: "assets/icons/todo_ic.png"))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }
}
