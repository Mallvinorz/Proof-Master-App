import 'package:proofmaster/app/data/responses/student/get_understanding_proof_activity_response/get_understanding_proof_activity_response.dart';
import 'package:proofmaster/app/data/responses/student/post_file_activity_response/upload_file_activity_response/upload_file_activity_response.dart';
import 'package:proofmaster/app/data/responses/teacher/get_answered_activity_from_student_response/get_answered_activity_from_student_response.dart';
import 'package:proofmaster/app/data/responses/teacher/post_review_response.dart';
import 'package:proofmaster/app/domain/entities/activity_review_dto/activityreviewdto.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/domain/entities/post_understanding_proof_answer_dto/postunderstandingproofanswedto.dart';

abstract class ActivityRepository {
  Future<UploadFileActivityResponse> uploadFile(
      PostUnderstandingProofAnsweDto dto);
  Future<List<ListItem>> getActivities();
  Future<GetUnderstandingProofActivityResponse> getActivity(String activityId);
  Future<PostReviewResponse> postReviewActivity(ActivityReviewDto dto);
  Future<List<ListItem>> getStudentAnsweredActivities(String studentId);
  Future<List<ListItem>> getStudentAnsweredActivitiesFromStudent();
  Future<GetAnsweredActivityFromStudentResponse> getStudentAnsweredActivity(
      String activityId);
}
