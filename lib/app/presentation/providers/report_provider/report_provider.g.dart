// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportRepositoryHash() => r'1ffe29b3dec6d3b4da310cfe81238ea56fd70355';

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
String _$getReportProgressHash() => r'4e1c85d327c7509c91e86d5e601992aac166091b';

/// See also [getReportProgress].
@ProviderFor(getReportProgress)
final getReportProgressProvider =
    AutoDisposeFutureProvider<List<ReportItem>>.internal(
  getReportProgress,
  name: r'getReportProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getReportProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetReportProgressRef = AutoDisposeFutureProviderRef<List<ReportItem>>;
String _$getStudentReportProgressHash() =>
    r'4805d4a7ef95c87cee07f7c557261b1873ec8ac0';

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

/// See also [getStudentReportProgress].
@ProviderFor(getStudentReportProgress)
const getStudentReportProgressProvider = GetStudentReportProgressFamily();

/// See also [getStudentReportProgress].
class GetStudentReportProgressFamily
    extends Family<AsyncValue<List<ReportItem>>> {
  /// See also [getStudentReportProgress].
  const GetStudentReportProgressFamily();

  /// See also [getStudentReportProgress].
  GetStudentReportProgressProvider call(
    String studentId,
  ) {
    return GetStudentReportProgressProvider(
      studentId,
    );
  }

  @override
  GetStudentReportProgressProvider getProviderOverride(
    covariant GetStudentReportProgressProvider provider,
  ) {
    return call(
      provider.studentId,
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
  String? get name => r'getStudentReportProgressProvider';
}

/// See also [getStudentReportProgress].
class GetStudentReportProgressProvider
    extends AutoDisposeFutureProvider<List<ReportItem>> {
  /// See also [getStudentReportProgress].
  GetStudentReportProgressProvider(
    String studentId,
  ) : this._internal(
          (ref) => getStudentReportProgress(
            ref as GetStudentReportProgressRef,
            studentId,
          ),
          from: getStudentReportProgressProvider,
          name: r'getStudentReportProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getStudentReportProgressHash,
          dependencies: GetStudentReportProgressFamily._dependencies,
          allTransitiveDependencies:
              GetStudentReportProgressFamily._allTransitiveDependencies,
          studentId: studentId,
        );

  GetStudentReportProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.studentId,
  }) : super.internal();

  final String studentId;

  @override
  Override overrideWith(
    FutureOr<List<ReportItem>> Function(GetStudentReportProgressRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetStudentReportProgressProvider._internal(
        (ref) => create(ref as GetStudentReportProgressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        studentId: studentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ReportItem>> createElement() {
    return _GetStudentReportProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStudentReportProgressProvider &&
        other.studentId == studentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetStudentReportProgressRef
    on AutoDisposeFutureProviderRef<List<ReportItem>> {
  /// The parameter `studentId` of this provider.
  String get studentId;
}

class _GetStudentReportProgressProviderElement
    extends AutoDisposeFutureProviderElement<List<ReportItem>>
    with GetStudentReportProgressRef {
  _GetStudentReportProgressProviderElement(super.provider);

  @override
  String get studentId =>
      (origin as GetStudentReportProgressProvider).studentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
