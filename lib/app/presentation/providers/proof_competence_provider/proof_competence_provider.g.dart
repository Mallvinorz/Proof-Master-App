// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof_competence_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$proofCompetenceRepositoryHash() =>
    r'6014e3c50f86d141ba5d02296fc404672a65fb0a';

/// See also [proofCompetenceRepository].
@ProviderFor(proofCompetenceRepository)
final proofCompetenceRepositoryProvider =
    AutoDisposeProvider<ProofComptenceRepository>.internal(
  proofCompetenceRepository,
  name: r'proofCompetenceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$proofCompetenceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProofCompetenceRepositoryRef
    = AutoDisposeProviderRef<ProofComptenceRepository>;
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
String _$menusHash() => r'99080a5dedb8d909008857475091c6e3f36ff17b';

/// See also [Menus].
@ProviderFor(Menus)
final menusProvider =
    AutoDisposeAsyncNotifierProvider<Menus, List<MenuItem>>.internal(
  Menus.new,
  name: r'menusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$menusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Menus = AutoDisposeAsyncNotifier<List<MenuItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
