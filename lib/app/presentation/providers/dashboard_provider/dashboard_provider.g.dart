// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardRepositoryHash() =>
    r'42ccf812222770ca5e019b7125679606d6e4ed79';

/// See also [dashboardRepository].
@ProviderFor(dashboardRepository)
final dashboardRepositoryProvider =
    AutoDisposeProvider<DashboardRepository>.internal(
  dashboardRepository,
  name: r'dashboardRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardRepositoryRef = AutoDisposeProviderRef<DashboardRepository>;
String _$getStudentMenusHash() => r'f616c903cdc890045cb082e8ccdfe4f1a19646a3';

/// See also [getStudentMenus].
@ProviderFor(getStudentMenus)
final getStudentMenusProvider =
    AutoDisposeFutureProvider<List<MenuItem>>.internal(
  getStudentMenus,
  name: r'getStudentMenusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getStudentMenusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetStudentMenusRef = AutoDisposeFutureProviderRef<List<MenuItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
