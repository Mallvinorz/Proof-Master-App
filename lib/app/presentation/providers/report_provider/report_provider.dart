import 'package:proofmaster/app/data/repositories/report_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';
import 'package:proofmaster/app/domain/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_provider.g.dart';

@riverpod
ReportRepository reportRepository(ReportRepositoryRef ref) {
  return ReportRepositoryImpl();
}

@riverpod
class IsRefreshing extends _$IsRefreshing {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class MyReportProgress extends _$MyReportProgress {
  @override
  Future<List<ReportItem>> build() async {
    return _fetchReports();
  }

  Future<List<ReportItem>> _fetchReports() async {
    final repository = ref.watch(reportRepositoryProvider);
    return repository.getReportProgress();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchReports());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}

@riverpod
class StudentReportProgress extends _$StudentReportProgress {
  @override
  Future<List<ReportItem>> build(String id) async {
    return _fetchReportStudent(id);
  }

  Future<List<ReportItem>> _fetchReportStudent(String id) async {
    final repository = ref.watch(reportRepositoryProvider);
    return repository.getReportProgressStudent(id);
  }

  Future<void> refresh(String id) async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchReportStudent(id));
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}
