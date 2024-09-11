import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/post_file_activity_response/upload_file_activity_response/upload_file_activity_response.dart';
import 'package:proofmaster/app/domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final _baseUrl = 'e2b2-158-140-172-74.ngrok-free.app';
  ActivityRepositoryImpl(this.client);
  final http.Client client;
  @override
  Future<UploadFileActivityResponse> uploadFile(File pdfFile, String id) async {
    final url = Uri.https(_baseUrl, "api/test");

    final request = http.MultipartRequest('POST', url);
    request.files.add(http.MultipartFile(
      'file',
      pdfFile.readAsBytes().asStream(),
      pdfFile.lengthSync(),
      filename: "testfile",
    ));
    final streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final result = UploadFileActivityResponse.fromJson(response.body);
      return result;
    } else {
      throw Exception(
          'Failed to upload file and register. Status code: ${response.statusCode}');
    }
  }
}
