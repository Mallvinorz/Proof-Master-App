import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/teacher/get_students_response/get_students_response.dart';
import 'package:proofmaster/app/domain/repositories/student_repository.dart';
import 'package:proofmaster/app/utils/shared_pref.dart';

class StudentRepositoryImpl implements StudentRepository {
  StudentRepositoryImpl(this.client);
  final http.Client client;

  @override
  Future<GetStudentsResponse> getStudents() async {
    try {
      final authToken = (await pref).getString(AUTH_TOKEN);
      final url = Uri.https('oh-my-api-seven.vercel.app', 'api/end-to-end',
          {"id": "52123b96-e618-4abd-b206-47356ab86874"});

      final response = await client.get(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': "Bearer $authToken",
        },
      );

      final result = GetStudentsResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
