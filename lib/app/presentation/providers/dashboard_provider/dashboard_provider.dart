import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/dashboard_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/dashboard_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepositoryImpl(http.Client());
}

// this will generate a fetchWeatherProvider
@riverpod
Future<List<MenuItem>> getStudentMenus(GetStudentMenusRef ref) {
  return ref.watch(dashboardRepositoryProvider).getStudentMenus();
}
