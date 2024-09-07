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
String _$authRepositoryHash() => r'1c8be288571ca06fe4e803d16111ae2afb53e010';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$getInitialRouteHash() => r'3c79ab8d467dc5e9f11bd24cbe66d7c5e4e99c25';

/// See also [getInitialRoute].
@ProviderFor(getInitialRoute)
final getInitialRouteProvider = AutoDisposeFutureProvider<String>.internal(
  getInitialRoute,
  name: r'getInitialRouteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getInitialRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetInitialRouteRef = AutoDisposeFutureProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
