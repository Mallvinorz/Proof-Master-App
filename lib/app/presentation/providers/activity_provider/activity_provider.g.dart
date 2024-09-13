// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityRepositoryHash() =>
    r'2c25c17255a5ef0e253b5b375b786878ca860b7c';

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
String _$activityHash() => r'9839d9739c93b6db463a070f9793ec5f2a2e21d8';

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
