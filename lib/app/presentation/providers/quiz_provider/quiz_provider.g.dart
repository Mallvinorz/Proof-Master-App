// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizRepositoryHash() => r'a724972f60b4bdba6ae09ad421fc57d9ffc3acec';

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
String _$getQuizQuestionsFromHash() =>
    r'ba5a7f979302e99deb4d12cb9f45b33d83441fa1';

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

/// See also [getQuizQuestionsFrom].
@ProviderFor(getQuizQuestionsFrom)
const getQuizQuestionsFromProvider = GetQuizQuestionsFromFamily();

/// See also [getQuizQuestionsFrom].
class GetQuizQuestionsFromFamily
    extends Family<AsyncValue<GetQuizQuestionsResponse>> {
  /// See also [getQuizQuestionsFrom].
  const GetQuizQuestionsFromFamily();

  /// See also [getQuizQuestionsFrom].
  GetQuizQuestionsFromProvider call(
    String id,
  ) {
    return GetQuizQuestionsFromProvider(
      id,
    );
  }

  @override
  GetQuizQuestionsFromProvider getProviderOverride(
    covariant GetQuizQuestionsFromProvider provider,
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
  String? get name => r'getQuizQuestionsFromProvider';
}

/// See also [getQuizQuestionsFrom].
class GetQuizQuestionsFromProvider
    extends AutoDisposeFutureProvider<GetQuizQuestionsResponse> {
  /// See also [getQuizQuestionsFrom].
  GetQuizQuestionsFromProvider(
    String id,
  ) : this._internal(
          (ref) => getQuizQuestionsFrom(
            ref as GetQuizQuestionsFromRef,
            id,
          ),
          from: getQuizQuestionsFromProvider,
          name: r'getQuizQuestionsFromProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getQuizQuestionsFromHash,
          dependencies: GetQuizQuestionsFromFamily._dependencies,
          allTransitiveDependencies:
              GetQuizQuestionsFromFamily._allTransitiveDependencies,
          id: id,
        );

  GetQuizQuestionsFromProvider._internal(
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
    FutureOr<GetQuizQuestionsResponse> Function(
            GetQuizQuestionsFromRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetQuizQuestionsFromProvider._internal(
        (ref) => create(ref as GetQuizQuestionsFromRef),
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
  AutoDisposeFutureProviderElement<GetQuizQuestionsResponse> createElement() {
    return _GetQuizQuestionsFromProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuizQuestionsFromProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetQuizQuestionsFromRef
    on AutoDisposeFutureProviderRef<GetQuizQuestionsResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetQuizQuestionsFromProviderElement
    extends AutoDisposeFutureProviderElement<GetQuizQuestionsResponse>
    with GetQuizQuestionsFromRef {
  _GetQuizQuestionsFromProviderElement(super.provider);

  @override
  String get id => (origin as GetQuizQuestionsFromProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
