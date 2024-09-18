// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityRepositoryHash() =>
    r'a31ca0af5cb049e25f9be456f511517a7a079786';

/// See also [activityRepository].
@ProviderFor(activityRepository)
final activityRepositoryProvider =
    AutoDisposeProvider<ActivityRepository>.internal(
  activityRepository,
  name: r'activityRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityRepositoryRef = AutoDisposeProviderRef<ActivityRepository>;
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
String _$proofUnderstadingActivitiesHash() =>
    r'd382f2c53dc28b921cc489e3d9b1420c8bdeeb4a';

/// See also [ProofUnderstadingActivities].
@ProviderFor(ProofUnderstadingActivities)
final proofUnderstadingActivitiesProvider = AutoDisposeAsyncNotifierProvider<
    ProofUnderstadingActivities, List<ListItem>>.internal(
  ProofUnderstadingActivities.new,
  name: r'proofUnderstadingActivitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$proofUnderstadingActivitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProofUnderstadingActivities
    = AutoDisposeAsyncNotifier<List<ListItem>>;
String _$isRefreshingAnsweredHash() =>
    r'd45b2c9fe5c862d9792a3b846c14a7370e034d24';

/// See also [IsRefreshingAnswered].
@ProviderFor(IsRefreshingAnswered)
final isRefreshingAnsweredProvider =
    AutoDisposeNotifierProvider<IsRefreshingAnswered, bool>.internal(
  IsRefreshingAnswered.new,
  name: r'isRefreshingAnsweredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isRefreshingAnsweredHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsRefreshingAnswered = AutoDisposeNotifier<bool>;
String _$proofUnderstadingAnsweredActivitiesHash() =>
    r'19212913a98b059be9cdb82e991e01a3fe30dc74';

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

abstract class _$ProofUnderstadingAnsweredActivities
    extends BuildlessAutoDisposeAsyncNotifier<List<ListItem>> {
  late final String studentId;

  FutureOr<List<ListItem>> build(
    String studentId,
  );
}

/// See also [ProofUnderstadingAnsweredActivities].
@ProviderFor(ProofUnderstadingAnsweredActivities)
const proofUnderstadingAnsweredActivitiesProvider =
    ProofUnderstadingAnsweredActivitiesFamily();

/// See also [ProofUnderstadingAnsweredActivities].
class ProofUnderstadingAnsweredActivitiesFamily
    extends Family<AsyncValue<List<ListItem>>> {
  /// See also [ProofUnderstadingAnsweredActivities].
  const ProofUnderstadingAnsweredActivitiesFamily();

  /// See also [ProofUnderstadingAnsweredActivities].
  ProofUnderstadingAnsweredActivitiesProvider call(
    String studentId,
  ) {
    return ProofUnderstadingAnsweredActivitiesProvider(
      studentId,
    );
  }

  @override
  ProofUnderstadingAnsweredActivitiesProvider getProviderOverride(
    covariant ProofUnderstadingAnsweredActivitiesProvider provider,
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
  String? get name => r'proofUnderstadingAnsweredActivitiesProvider';
}

/// See also [ProofUnderstadingAnsweredActivities].
class ProofUnderstadingAnsweredActivitiesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        ProofUnderstadingAnsweredActivities, List<ListItem>> {
  /// See also [ProofUnderstadingAnsweredActivities].
  ProofUnderstadingAnsweredActivitiesProvider(
    String studentId,
  ) : this._internal(
          () => ProofUnderstadingAnsweredActivities()..studentId = studentId,
          from: proofUnderstadingAnsweredActivitiesProvider,
          name: r'proofUnderstadingAnsweredActivitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$proofUnderstadingAnsweredActivitiesHash,
          dependencies: ProofUnderstadingAnsweredActivitiesFamily._dependencies,
          allTransitiveDependencies: ProofUnderstadingAnsweredActivitiesFamily
              ._allTransitiveDependencies,
          studentId: studentId,
        );

  ProofUnderstadingAnsweredActivitiesProvider._internal(
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
  FutureOr<List<ListItem>> runNotifierBuild(
    covariant ProofUnderstadingAnsweredActivities notifier,
  ) {
    return notifier.build(
      studentId,
    );
  }

  @override
  Override overrideWith(ProofUnderstadingAnsweredActivities Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProofUnderstadingAnsweredActivitiesProvider._internal(
        () => create()..studentId = studentId,
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
  AutoDisposeAsyncNotifierProviderElement<ProofUnderstadingAnsweredActivities,
      List<ListItem>> createElement() {
    return _ProofUnderstadingAnsweredActivitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProofUnderstadingAnsweredActivitiesProvider &&
        other.studentId == studentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProofUnderstadingAnsweredActivitiesRef
    on AutoDisposeAsyncNotifierProviderRef<List<ListItem>> {
  /// The parameter `studentId` of this provider.
  String get studentId;
}

class _ProofUnderstadingAnsweredActivitiesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        ProofUnderstadingAnsweredActivities,
        List<ListItem>> with ProofUnderstadingAnsweredActivitiesRef {
  _ProofUnderstadingAnsweredActivitiesProviderElement(super.provider);

  @override
  String get studentId =>
      (origin as ProofUnderstadingAnsweredActivitiesProvider).studentId;
}

String _$isRefreshingAnsweredDetailHash() =>
    r'1e09be101f23c5abe74896ba5fbbfd88faa9f87b';

/// See also [IsRefreshingAnsweredDetail].
@ProviderFor(IsRefreshingAnsweredDetail)
final isRefreshingAnsweredDetailProvider =
    AutoDisposeNotifierProvider<IsRefreshingAnsweredDetail, bool>.internal(
  IsRefreshingAnsweredDetail.new,
  name: r'isRefreshingAnsweredDetailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isRefreshingAnsweredDetailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsRefreshingAnsweredDetail = AutoDisposeNotifier<bool>;
String _$proofUnderstadingAnsweredDetailActivityHash() =>
    r'f7885835d16ef3c6bcaed2c5a73eb2286f0fbdb9';

abstract class _$ProofUnderstadingAnsweredDetailActivity
    extends BuildlessAutoDisposeAsyncNotifier<
        GetAnsweredActivityFromStudentResponse> {
  late final String activityId;

  FutureOr<GetAnsweredActivityFromStudentResponse> build(
    String activityId,
  );
}

/// See also [ProofUnderstadingAnsweredDetailActivity].
@ProviderFor(ProofUnderstadingAnsweredDetailActivity)
const proofUnderstadingAnsweredDetailActivityProvider =
    ProofUnderstadingAnsweredDetailActivityFamily();

/// See also [ProofUnderstadingAnsweredDetailActivity].
class ProofUnderstadingAnsweredDetailActivityFamily
    extends Family<AsyncValue<GetAnsweredActivityFromStudentResponse>> {
  /// See also [ProofUnderstadingAnsweredDetailActivity].
  const ProofUnderstadingAnsweredDetailActivityFamily();

  /// See also [ProofUnderstadingAnsweredDetailActivity].
  ProofUnderstadingAnsweredDetailActivityProvider call(
    String activityId,
  ) {
    return ProofUnderstadingAnsweredDetailActivityProvider(
      activityId,
    );
  }

  @override
  ProofUnderstadingAnsweredDetailActivityProvider getProviderOverride(
    covariant ProofUnderstadingAnsweredDetailActivityProvider provider,
  ) {
    return call(
      provider.activityId,
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
  String? get name => r'proofUnderstadingAnsweredDetailActivityProvider';
}

/// See also [ProofUnderstadingAnsweredDetailActivity].
class ProofUnderstadingAnsweredDetailActivityProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        ProofUnderstadingAnsweredDetailActivity,
        GetAnsweredActivityFromStudentResponse> {
  /// See also [ProofUnderstadingAnsweredDetailActivity].
  ProofUnderstadingAnsweredDetailActivityProvider(
    String activityId,
  ) : this._internal(
          () => ProofUnderstadingAnsweredDetailActivity()
            ..activityId = activityId,
          from: proofUnderstadingAnsweredDetailActivityProvider,
          name: r'proofUnderstadingAnsweredDetailActivityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$proofUnderstadingAnsweredDetailActivityHash,
          dependencies:
              ProofUnderstadingAnsweredDetailActivityFamily._dependencies,
          allTransitiveDependencies:
              ProofUnderstadingAnsweredDetailActivityFamily
                  ._allTransitiveDependencies,
          activityId: activityId,
        );

  ProofUnderstadingAnsweredDetailActivityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activityId,
  }) : super.internal();

  final String activityId;

  @override
  FutureOr<GetAnsweredActivityFromStudentResponse> runNotifierBuild(
    covariant ProofUnderstadingAnsweredDetailActivity notifier,
  ) {
    return notifier.build(
      activityId,
    );
  }

  @override
  Override overrideWith(
      ProofUnderstadingAnsweredDetailActivity Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProofUnderstadingAnsweredDetailActivityProvider._internal(
        () => create()..activityId = activityId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activityId: activityId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      ProofUnderstadingAnsweredDetailActivity,
      GetAnsweredActivityFromStudentResponse> createElement() {
    return _ProofUnderstadingAnsweredDetailActivityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProofUnderstadingAnsweredDetailActivityProvider &&
        other.activityId == activityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProofUnderstadingAnsweredDetailActivityRef
    on AutoDisposeAsyncNotifierProviderRef<
        GetAnsweredActivityFromStudentResponse> {
  /// The parameter `activityId` of this provider.
  String get activityId;
}

class _ProofUnderstadingAnsweredDetailActivityProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        ProofUnderstadingAnsweredDetailActivity,
        GetAnsweredActivityFromStudentResponse>
    with ProofUnderstadingAnsweredDetailActivityRef {
  _ProofUnderstadingAnsweredDetailActivityProviderElement(super.provider);

  @override
  String get activityId =>
      (origin as ProofUnderstadingAnsweredDetailActivityProvider).activityId;
}

String _$isRefreshingPdfActivityHash() =>
    r'cb3a3df14d06fb1977a76fe855d7147ecd4a6115';

/// See also [IsRefreshingPdfActivity].
@ProviderFor(IsRefreshingPdfActivity)
final isRefreshingPdfActivityProvider =
    AutoDisposeNotifierProvider<IsRefreshingPdfActivity, bool>.internal(
  IsRefreshingPdfActivity.new,
  name: r'isRefreshingPdfActivityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isRefreshingPdfActivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsRefreshingPdfActivity = AutoDisposeNotifier<bool>;
String _$proofUnderstadingActivityHash() =>
    r'f0c269f4190537fa1e805acea69b72c3cd71c694';

abstract class _$ProofUnderstadingActivity
    extends BuildlessAutoDisposeAsyncNotifier<
        GetUnderstandingProofActivityResponse> {
  late final String activityId;

  FutureOr<GetUnderstandingProofActivityResponse> build(
    String activityId,
  );
}

/// See also [ProofUnderstadingActivity].
@ProviderFor(ProofUnderstadingActivity)
const proofUnderstadingActivityProvider = ProofUnderstadingActivityFamily();

/// See also [ProofUnderstadingActivity].
class ProofUnderstadingActivityFamily
    extends Family<AsyncValue<GetUnderstandingProofActivityResponse>> {
  /// See also [ProofUnderstadingActivity].
  const ProofUnderstadingActivityFamily();

  /// See also [ProofUnderstadingActivity].
  ProofUnderstadingActivityProvider call(
    String activityId,
  ) {
    return ProofUnderstadingActivityProvider(
      activityId,
    );
  }

  @override
  ProofUnderstadingActivityProvider getProviderOverride(
    covariant ProofUnderstadingActivityProvider provider,
  ) {
    return call(
      provider.activityId,
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
  String? get name => r'proofUnderstadingActivityProvider';
}

/// See also [ProofUnderstadingActivity].
class ProofUnderstadingActivityProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProofUnderstadingActivity,
        GetUnderstandingProofActivityResponse> {
  /// See also [ProofUnderstadingActivity].
  ProofUnderstadingActivityProvider(
    String activityId,
  ) : this._internal(
          () => ProofUnderstadingActivity()..activityId = activityId,
          from: proofUnderstadingActivityProvider,
          name: r'proofUnderstadingActivityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$proofUnderstadingActivityHash,
          dependencies: ProofUnderstadingActivityFamily._dependencies,
          allTransitiveDependencies:
              ProofUnderstadingActivityFamily._allTransitiveDependencies,
          activityId: activityId,
        );

  ProofUnderstadingActivityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activityId,
  }) : super.internal();

  final String activityId;

  @override
  FutureOr<GetUnderstandingProofActivityResponse> runNotifierBuild(
    covariant ProofUnderstadingActivity notifier,
  ) {
    return notifier.build(
      activityId,
    );
  }

  @override
  Override overrideWith(ProofUnderstadingActivity Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProofUnderstadingActivityProvider._internal(
        () => create()..activityId = activityId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activityId: activityId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProofUnderstadingActivity,
      GetUnderstandingProofActivityResponse> createElement() {
    return _ProofUnderstadingActivityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProofUnderstadingActivityProvider &&
        other.activityId == activityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProofUnderstadingActivityRef on AutoDisposeAsyncNotifierProviderRef<
    GetUnderstandingProofActivityResponse> {
  /// The parameter `activityId` of this provider.
  String get activityId;
}

class _ProofUnderstadingActivityProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProofUnderstadingActivity,
        GetUnderstandingProofActivityResponse>
    with ProofUnderstadingActivityRef {
  _ProofUnderstadingActivityProviderElement(super.provider);

  @override
  String get activityId =>
      (origin as ProofUnderstadingActivityProvider).activityId;
}

String _$activityHash() => r'322359b109d4e75194a3773eac03ecb41889dca2';

/// See also [Activity].
@ProviderFor(Activity)
final activityProvider =
    AutoDisposeNotifierProvider<Activity, ActivityState>.internal(
  Activity.new,
  name: r'activityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Activity = AutoDisposeNotifier<ActivityState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
