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
String _$dashboardStudentMenusHash() =>
    r'edd18e408547f9e20a7d87b28da17823be13635d';

/// See also [DashboardStudentMenus].
@ProviderFor(DashboardStudentMenus)
final dashboardStudentMenusProvider = AutoDisposeAsyncNotifierProvider<
    DashboardStudentMenus, List<MenuItem>>.internal(
  DashboardStudentMenus.new,
  name: r'dashboardStudentMenusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardStudentMenusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DashboardStudentMenus = AutoDisposeAsyncNotifier<List<MenuItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
