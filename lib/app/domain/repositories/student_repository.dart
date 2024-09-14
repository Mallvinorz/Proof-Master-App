import 'package:proofmaster/app/data/responses/teacher/get_students_response/get_students_response.dart';

abstract class StudentRepository {
  Future<GetStudentsResponse> getStudents();
}
