import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/student_repository_impl.dart';
import 'package:proofmaster/app/data/responses/teacher/get_students_response/student.dart';
import 'package:proofmaster/app/domain/repositories/student_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'student_provider.g.dart';

@Riverpod(keepAlive: true)
StudentRepository studentRepository(StudentRepositoryRef ref) {
  return StudentRepositoryImpl(http.Client());
}

@Riverpod(keepAlive: true)
class IsRefreshingStudent extends _$IsRefreshingStudent {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@Riverpod(keepAlive: true)
class Students extends _$Students {
  List<Student?>? _initialStudents;
  @override
  Future<List<Student?>> build() async {
    final currentStateStudents = await _fetchStudentsReponse();
    _initialStudents = currentStateStudents;
    return currentStateStudents;
  }

  Future<List<Student?>> _fetchStudentsReponse() async {
    final repository = ref.watch(studentRepositoryProvider);
    final response = await repository.getStudents();
    return response.data?.students ?? [];
  }

  void search(String query) {
    if (query == "") {
      state = AsyncData(_initialStudents ?? []);
    } else {
      final lowercaseQuery = query.toLowerCase();

      final filtered = _initialStudents?.where((student) {
            return student?.name?.toLowerCase().contains(lowercaseQuery) ??
                false;
          }).toList() ??
          [];
      state = AsyncData(filtered);
    }
  }

  Future<void> refresh() async {
    ref.read(isRefreshingStudentProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchStudentsReponse());
    ref.read(isRefreshingStudentProvider.notifier).setRefreshing(false);
  }
}
