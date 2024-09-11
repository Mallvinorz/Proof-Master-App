import 'dart:io';

import 'package:proofmaster/app/data/responses/student/post_file_activity_response/upload_file_activity_response/upload_file_activity_response.dart';

abstract class ActivityRepository {
  Future<UploadFileActivityResponse> uploadFile(
      File pdfFile, String filename, String id);
}
