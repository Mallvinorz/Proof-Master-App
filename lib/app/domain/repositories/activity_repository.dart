import 'dart:io';

import 'package:proofmaster/app/data/responses/student/post_file_activity_response/upload_file_activity_response/upload_file_activity_response.dart';
import 'package:proofmaster/app/data/responses/teacher/post_review_response.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';

abstract class ActivityRepository {
  Future<UploadFileActivityResponse> uploadFile(
      File pdfFile, String filename, String id);
  Future<List<ListItem>> getActivities();
  Future<PostReviewResponse> postReviewActivity();
}
