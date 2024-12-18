// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentRepositoryHash() => r'20d8a0b5d69f2ee2efd702344b360932982e0f95';

/// See also [studentRepository].
@ProviderFor(studentRepository)
final studentRepositoryProvider = Provider<StudentRepository>.internal(
  studentRepository,
  name: r'studentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$studentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StudentRepositoryRef = ProviderRef<StudentRepository>;
String _$isRefreshingStudentHash() =>
    r'daaa40954ac16f4e528dfba03f0ab34e605c65fa';

/// See also [IsRefreshingStudent].
@ProviderFor(IsRefreshingStudent)
final isRefreshingStudentProvider =
    NotifierProvider<IsRefreshingStudent, bool>.internal(
  IsRefreshingStudent.new,
  name: r'isRefreshingStudentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isRefreshingStudentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsRefreshingStudent = Notifier<bool>;
String _$studentsHash() => r'1438fdc742e1341bebe55b1abd9317ac24decd1f';

/// See also [Students].
@ProviderFor(Students)
final studentsProvider =
    AsyncNotifierProvider<Students, List<Student?>>.internal(
  Students.new,
  name: r'studentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$studentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Students = AsyncNotifier<List<Student?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
