import 'package:proofmaster/app/data/responses/teacher/get_students_response/get_students_response.dart';
import 'package:proofmaster/app/domain/repositories/student_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';

class StudentRepositoryImpl implements StudentRepository {
  @override
  Future<GetStudentsResponse> getStudents() async {
    try {
      final url = Uri.http('43.228.213.172:3000', 'api/students');

      final response = await httpClientWithInterceptor.get(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
        },
      );

      final result = GetStudentsResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
