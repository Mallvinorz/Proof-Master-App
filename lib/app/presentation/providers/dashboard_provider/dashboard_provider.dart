import 'package:proofmaster/app/data/repositories/dashboard_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/dashboard_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepositoryImpl();
}

@riverpod
class IsRefreshing extends _$IsRefreshing {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class DashboardStudentMenus extends _$DashboardStudentMenus {
  @override
  Future<List<MenuItem>> build() async {
    return _fetchMenus();
  }

  Future<List<MenuItem>> _fetchMenus() async {
    final repository = ref.watch(dashboardRepositoryProvider);
    return repository.getStudentMenus();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchMenus());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}
