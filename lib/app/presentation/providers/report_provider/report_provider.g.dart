// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportRepositoryHash() => r'3a0af6d5aae3ecc6ed91e624e2f4e7895dd66640';

/// See also [reportRepository].
@ProviderFor(reportRepository)
final reportRepositoryProvider = AutoDisposeProvider<ReportRepository>.internal(
  reportRepository,
  name: r'reportRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReportRepositoryRef = AutoDisposeProviderRef<ReportRepository>;
String _$isRefreshingHash() => r'7a65fe8564c8d35a307ba08c0cb720c2a3d06e75';

/// See also [IsRefreshing].
@ProviderFor(IsRefreshing)
final isRefreshingProvider =
    AutoDisposeNotifierProvider<IsRefreshing, bool>.internal(
  IsRefreshing.new,
  name: r'isRefreshingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isRefreshingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsRefreshing = AutoDisposeNotifier<bool>;
String _$myReportProgressHash() => r'6a536d9e5782f290593817a1090b1dd6425c14eb';

/// See also [MyReportProgress].
@ProviderFor(MyReportProgress)
final myReportProgressProvider = AutoDisposeAsyncNotifierProvider<
    MyReportProgress, List<ReportItem>>.internal(
  MyReportProgress.new,
  name: r'myReportProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myReportProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyReportProgress = AutoDisposeAsyncNotifier<List<ReportItem>>;
String _$studentReportProgressHash() =>
    r'a79dca061c3896d752940507fcb576d44333e0b6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$StudentReportProgress
    extends BuildlessAutoDisposeAsyncNotifier<List<ReportItem>> {
  late final String id;

  FutureOr<List<ReportItem>> build(
    String id,
  );
}

/// See also [StudentReportProgress].
@ProviderFor(StudentReportProgress)
const studentReportProgressProvider = StudentReportProgressFamily();

/// See also [StudentReportProgress].
class StudentReportProgressFamily extends Family<AsyncValue<List<ReportItem>>> {
  /// See also [StudentReportProgress].
  const StudentReportProgressFamily();

  /// See also [StudentReportProgress].
  StudentReportProgressProvider call(
    String id,
  ) {
    return StudentReportProgressProvider(
      id,
    );
  }

  @override
  StudentReportProgressProvider getProviderOverride(
    covariant StudentReportProgressProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'studentReportProgressProvider';
}

/// See also [StudentReportProgress].
class StudentReportProgressProvider
    extends AutoDisposeAsyncNotifierProviderImpl<StudentReportProgress,
        List<ReportItem>> {
  /// See also [StudentReportProgress].
  StudentReportProgressProvider(
    String id,
  ) : this._internal(
          () => StudentReportProgress()..id = id,
          from: studentReportProgressProvider,
          name: r'studentReportProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$studentReportProgressHash,
          dependencies: StudentReportProgressFamily._dependencies,
          allTransitiveDependencies:
              StudentReportProgressFamily._allTransitiveDependencies,
          id: id,
        );

  StudentReportProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<List<ReportItem>> runNotifierBuild(
    covariant StudentReportProgress notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(StudentReportProgress Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentReportProgressProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<StudentReportProgress,
      List<ReportItem>> createElement() {
    return _StudentReportProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentReportProgressProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StudentReportProgressRef
    on AutoDisposeAsyncNotifierProviderRef<List<ReportItem>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _StudentReportProgressProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StudentReportProgress,
        List<ReportItem>> with StudentReportProgressRef {
  _StudentReportProgressProviderElement(super.provider);

  @override
  String get id => (origin as StudentReportProgressProvider).id;
}

String _$isRefreshingDiagnosticHash() =>
    r'73ff20549e37d89513e424192627a871667096b2';

/// See also [IsRefreshingDiagnostic].
@ProviderFor(IsRefreshingDiagnostic)
final isRefreshingDiagnosticProvider =
    AutoDisposeNotifierProvider<IsRefreshingDiagnostic, bool>.internal(
  IsRefreshingDiagnostic.new,
  name: r'isRefreshingDiagnosticProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isRefreshingDiagnosticHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsRefreshingDiagnostic = AutoDisposeNotifier<bool>;
String _$diagnosticReportHash() => r'9d8d0d580a0d29a16af4890cb780fbaf156ca0db';

abstract class _$DiagnosticReport
    extends BuildlessAutoDisposeAsyncNotifier<GetDiagnosticReportResponse> {
  late final String quizId;
  late final String? studentId;

  FutureOr<GetDiagnosticReportResponse> build({
    required String quizId,
    String? studentId,
  });
}

/// See also [DiagnosticReport].
@ProviderFor(DiagnosticReport)
const diagnosticReportProvider = DiagnosticReportFamily();

/// See also [DiagnosticReport].
class DiagnosticReportFamily
    extends Family<AsyncValue<GetDiagnosticReportResponse>> {
  /// See also [DiagnosticReport].
  const DiagnosticReportFamily();

  /// See also [DiagnosticReport].
  DiagnosticReportProvider call({
    required String quizId,
    String? studentId,
  }) {
    return DiagnosticReportProvider(
      quizId: quizId,
      studentId: studentId,
    );
  }

  @override
  DiagnosticReportProvider getProviderOverride(
    covariant DiagnosticReportProvider provider,
  ) {
    return call(
      quizId: provider.quizId,
      studentId: provider.studentId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'diagnosticReportProvider';
}

/// See also [DiagnosticReport].
class DiagnosticReportProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DiagnosticReport, GetDiagnosticReportResponse> {
  /// See also [DiagnosticReport].
  DiagnosticReportProvider({
    required String quizId,
    String? studentId,
  }) : this._internal(
          () => DiagnosticReport()
            ..quizId = quizId
            ..studentId = studentId,
          from: diagnosticReportProvider,
          name: r'diagnosticReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$diagnosticReportHash,
          dependencies: DiagnosticReportFamily._dependencies,
          allTransitiveDependencies:
              DiagnosticReportFamily._allTransitiveDependencies,
          quizId: quizId,
          studentId: studentId,
        );

  DiagnosticReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizId,
    required this.studentId,
  }) : super.internal();

  final String quizId;
  final String? studentId;

  @override
  FutureOr<GetDiagnosticReportResponse> runNotifierBuild(
    covariant DiagnosticReport notifier,
  ) {
    return notifier.build(
      quizId: quizId,
      studentId: studentId,
    );
  }

  @override
  Override overrideWith(DiagnosticReport Function() create) {
    return ProviderOverride(
      origin: this,
      override: DiagnosticReportProvider._internal(
        () => create()
          ..quizId = quizId
          ..studentId = studentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizId: quizId,
        studentId: studentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DiagnosticReport,
      GetDiagnosticReportResponse> createElement() {
    return _DiagnosticReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DiagnosticReportProvider &&
        other.quizId == quizId &&
        other.studentId == studentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DiagnosticReportRef
    on AutoDisposeAsyncNotifierProviderRef<GetDiagnosticReportResponse> {
  /// The parameter `quizId` of this provider.
  String get quizId;

  /// The parameter `studentId` of this provider.
  String? get studentId;
}

class _DiagnosticReportProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DiagnosticReport,
        GetDiagnosticReportResponse> with DiagnosticReportRef {
  _DiagnosticReportProviderElement(super.provider);

  @override
  String get quizId => (origin as DiagnosticReportProvider).quizId;
  @override
  String? get studentId => (origin as DiagnosticReportProvider).studentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
