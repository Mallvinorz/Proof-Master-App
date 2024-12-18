import 'package:proofmaster/app/data/repositories/introduction_proof_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/introduction_proof_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'introduction_proof_provider.g.dart';

@riverpod
IntroductionProofRepository introductionProofRepository(
    IntroductionProofRepositoryRef ref) {
  return IntroductionProofRepositoryImpl();
}

@riverpod
class IsRefreshing extends _$IsRefreshing {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class InstuductionProofMaterials extends _$InstuductionProofMaterials {
  @override
  Future<List<MenuItem>> build() async {
    return _fetchData();
  }

  Future<List<MenuItem>> _fetchData() async {
    final repository = ref.watch(introductionProofRepositoryProvider);
    return repository.getMenuItems();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchData());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}
