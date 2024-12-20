// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizRepositoryHash() => r'92dc91261ac35f79ddec59bb74f44f9b600cd39c';

/// See also [quizRepository].
@ProviderFor(quizRepository)
final quizRepositoryProvider = AutoDisposeProvider<QuizRepository>.internal(
  quizRepository,
  name: r'quizRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$quizRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef QuizRepositoryRef = AutoDisposeProviderRef<QuizRepository>;
String _$getDiagnosticQuizQuestionsFromHash() =>
    r'963df4c9440ec01ad864b6ef2b5d4e75a9911202';

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

/// See also [getDiagnosticQuizQuestionsFrom].
@ProviderFor(getDiagnosticQuizQuestionsFrom)
const getDiagnosticQuizQuestionsFromProvider =
    GetDiagnosticQuizQuestionsFromFamily();

/// See also [getDiagnosticQuizQuestionsFrom].
class GetDiagnosticQuizQuestionsFromFamily extends Family<AsyncValue<QuizDTO>> {
  /// See also [getDiagnosticQuizQuestionsFrom].
  const GetDiagnosticQuizQuestionsFromFamily();

  /// See also [getDiagnosticQuizQuestionsFrom].
  GetDiagnosticQuizQuestionsFromProvider call(
    String id,
  ) {
    return GetDiagnosticQuizQuestionsFromProvider(
      id,
    );
  }

  @override
  GetDiagnosticQuizQuestionsFromProvider getProviderOverride(
    covariant GetDiagnosticQuizQuestionsFromProvider provider,
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
  String? get name => r'getDiagnosticQuizQuestionsFromProvider';
}

/// See also [getDiagnosticQuizQuestionsFrom].
class GetDiagnosticQuizQuestionsFromProvider
    extends AutoDisposeFutureProvider<QuizDTO> {
  /// See also [getDiagnosticQuizQuestionsFrom].
  GetDiagnosticQuizQuestionsFromProvider(
    String id,
  ) : this._internal(
          (ref) => getDiagnosticQuizQuestionsFrom(
            ref as GetDiagnosticQuizQuestionsFromRef,
            id,
          ),
          from: getDiagnosticQuizQuestionsFromProvider,
          name: r'getDiagnosticQuizQuestionsFromProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDiagnosticQuizQuestionsFromHash,
          dependencies: GetDiagnosticQuizQuestionsFromFamily._dependencies,
          allTransitiveDependencies:
              GetDiagnosticQuizQuestionsFromFamily._allTransitiveDependencies,
          id: id,
        );

  GetDiagnosticQuizQuestionsFromProvider._internal(
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
  Override overrideWith(
    FutureOr<QuizDTO> Function(GetDiagnosticQuizQuestionsFromRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDiagnosticQuizQuestionsFromProvider._internal(
        (ref) => create(ref as GetDiagnosticQuizQuestionsFromRef),
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
  AutoDisposeFutureProviderElement<QuizDTO> createElement() {
    return _GetDiagnosticQuizQuestionsFromProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDiagnosticQuizQuestionsFromProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDiagnosticQuizQuestionsFromRef
    on AutoDisposeFutureProviderRef<QuizDTO> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetDiagnosticQuizQuestionsFromProviderElement
    extends AutoDisposeFutureProviderElement<QuizDTO>
    with GetDiagnosticQuizQuestionsFromRef {
  _GetDiagnosticQuizQuestionsFromProviderElement(super.provider);

  @override
  String get id => (origin as GetDiagnosticQuizQuestionsFromProvider).id;
}

String _$getProofCompetenceQuizQuestionsFromHash() =>
    r'5995598bc0d3cec3fc67789d325cf1909ca24608';

/// See also [getProofCompetenceQuizQuestionsFrom].
@ProviderFor(getProofCompetenceQuizQuestionsFrom)
const getProofCompetenceQuizQuestionsFromProvider =
    GetProofCompetenceQuizQuestionsFromFamily();

/// See also [getProofCompetenceQuizQuestionsFrom].
class GetProofCompetenceQuizQuestionsFromFamily
    extends Family<AsyncValue<QuizDTO>> {
  /// See also [getProofCompetenceQuizQuestionsFrom].
  const GetProofCompetenceQuizQuestionsFromFamily();

  /// See also [getProofCompetenceQuizQuestionsFrom].
  GetProofCompetenceQuizQuestionsFromProvider call(
    String id,
  ) {
    return GetProofCompetenceQuizQuestionsFromProvider(
      id,
    );
  }

  @override
  GetProofCompetenceQuizQuestionsFromProvider getProviderOverride(
    covariant GetProofCompetenceQuizQuestionsFromProvider provider,
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
  String? get name => r'getProofCompetenceQuizQuestionsFromProvider';
}

/// See also [getProofCompetenceQuizQuestionsFrom].
class GetProofCompetenceQuizQuestionsFromProvider
    extends AutoDisposeFutureProvider<QuizDTO> {
  /// See also [getProofCompetenceQuizQuestionsFrom].
  GetProofCompetenceQuizQuestionsFromProvider(
    String id,
  ) : this._internal(
          (ref) => getProofCompetenceQuizQuestionsFrom(
            ref as GetProofCompetenceQuizQuestionsFromRef,
            id,
          ),
          from: getProofCompetenceQuizQuestionsFromProvider,
          name: r'getProofCompetenceQuizQuestionsFromProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProofCompetenceQuizQuestionsFromHash,
          dependencies: GetProofCompetenceQuizQuestionsFromFamily._dependencies,
          allTransitiveDependencies: GetProofCompetenceQuizQuestionsFromFamily
              ._allTransitiveDependencies,
          id: id,
        );

  GetProofCompetenceQuizQuestionsFromProvider._internal(
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
  Override overrideWith(
    FutureOr<QuizDTO> Function(GetProofCompetenceQuizQuestionsFromRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProofCompetenceQuizQuestionsFromProvider._internal(
        (ref) => create(ref as GetProofCompetenceQuizQuestionsFromRef),
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
  AutoDisposeFutureProviderElement<QuizDTO> createElement() {
    return _GetProofCompetenceQuizQuestionsFromProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProofCompetenceQuizQuestionsFromProvider &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProofCompetenceQuizQuestionsFromRef
    on AutoDisposeFutureProviderRef<QuizDTO> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetProofCompetenceQuizQuestionsFromProviderElement
    extends AutoDisposeFutureProviderElement<QuizDTO>
    with GetProofCompetenceQuizQuestionsFromRef {
  _GetProofCompetenceQuizQuestionsFromProviderElement(super.provider);

  @override
  String get id => (origin as GetProofCompetenceQuizQuestionsFromProvider).id;
}

String _$quizHash() => r'b9d304d71d72af3476c306ddce47dafcadc008ce';

/// See also [Quiz].
@ProviderFor(Quiz)
final quizProvider = AutoDisposeNotifierProvider<Quiz, QuizState>.internal(
  Quiz.new,
  name: r'quizProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$quizHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Quiz = AutoDisposeNotifier<QuizState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
