import 'package:proofmaster/app/data/repositories/proof_competence_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/proof_competence_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'proof_competence_provider.g.dart';

@riverpod
ProofComptenceRepository proofCompetenceRepository(
    ProofCompetenceRepositoryRef ref) {
  return ProofCompetenceRepositoryImpl();
}

@riverpod
class IsRefreshing extends _$IsRefreshing {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class Menus extends _$Menus {
  @override
  Future<List<MenuItem>> build() async {
    return _fetchMenus();
  }

  Future<List<MenuItem>> _fetchMenus() async {
    final repository = ref.watch(proofCompetenceRepositoryProvider);
    return repository.getProofCompetenceMenus();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchMenus());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}
