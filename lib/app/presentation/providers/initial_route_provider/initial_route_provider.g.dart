// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_route_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingRepositoryHash() =>
    r'9f590cb519161e1bc169870ca4e0c97ee20fbec4';

/// See also [onboardingRepository].
@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider =
    AutoDisposeProvider<OnboardingRepository>.internal(
  onboardingRepository,
  name: r'onboardingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnboardingRepositoryRef = AutoDisposeProviderRef<OnboardingRepository>;
String _$initialRouteHash() => r'5d18e348b86dd635de0a6738fe708fbec93b91a5';

/// See also [InitialRoute].
@ProviderFor(InitialRoute)
final initialRouteProvider =
    AutoDisposeAsyncNotifierProvider<InitialRoute, String>.internal(
  InitialRoute.new,
  name: r'initialRouteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$initialRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InitialRoute = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
