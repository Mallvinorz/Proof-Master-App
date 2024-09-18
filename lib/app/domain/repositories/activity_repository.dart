
import 'package:proofmaster/app/data/responses/student/get_understanding_proof_activity_response/get_understanding_proof_activity_response.dart';
import 'package:proofmaster/app/data/responses/student/post_file_activity_response/upload_file_activity_response/upload_file_activity_response.dart';
import 'package:proofmaster/app/data/responses/teacher/post_review_response.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/domain/entities/post_understanding_proof_answer_dto/postunderstandingproofanswedto.dart';

abstract class ActivityRepository {
  Future<UploadFileActivityResponse> uploadFile(
      PostUnderstandingProofAnsweDto dto);
  Future<List<ListItem>> getActivities();
  Future<GetUnderstandingProofActivityResponse> getActivity(String activityId);
  Future<PostReviewResponse> postReviewActivity();
}
