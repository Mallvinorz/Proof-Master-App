import 'dart:io';
import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/post_file_activity_response/upload_file_activity_response/upload_file_activity_response.dart';
import 'package:proofmaster/app/domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final _baseUrl = '59ab-103-184-19-94.ngrok-free.app';
  ActivityRepositoryImpl(this.client);
  final http.Client client;
  @override
  Future<UploadFileActivityResponse> uploadFile(
      File pdfFile, String filename, String id) async {
    try {
      final url = Uri.https(_baseUrl, "api/test");

      final request = http.MultipartRequest('POST', url);
      request.files.add(http.MultipartFile(
        'file',
        pdfFile.readAsBytes().asStream(),
        pdfFile.lengthSync(),
        filename: filename,
      ));
      request.fields['id'] = id;

      final streamedResponse = await request.send();
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
}
