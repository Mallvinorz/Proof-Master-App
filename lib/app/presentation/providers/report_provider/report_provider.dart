import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/repositories/report_repository_impl.dart';
import 'package:proofmaster/app/data/responses/general/get_diagnostic_report/get_diagnostic_report_response/get_diagnostic_report_response.dart';
import 'package:proofmaster/app/data/responses/general/get_proof_competence_report_result/get_proof_competence_report_response/get_proof_competence_report_response.dart';
import 'package:proofmaster/app/domain/entities/intro_proof_report_item/intro_proof_report_item.dart';
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

@riverpod
class IsRefreshingDiagnostic extends _$IsRefreshingDiagnostic {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class DiagnosticReport extends _$DiagnosticReport {
  @override
  Future<GetDiagnosticReportResponse> build(
      {required String quizId, String? studentId}) async {
    return _fetchReports(quizId: quizId, studentId: studentId);
  }

  Future<GetDiagnosticReportResponse> _fetchReports(
      {required String quizId, String? studentId}) async {
    Fimber.d("  REQUEST $studentId");
    final repository = ref.watch(reportRepositoryProvider);
    return studentId != null && studentId.isNotEmpty
        ? repository.getDiagnosticReportFromStudent(quizId, studentId)
        : repository.getDiagnosticReport(quizId);
  }

  Future<void> refresh({required String quizId, String? studentId}) async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _fetchReports(quizId: quizId, studentId: studentId));
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}

@riverpod
class ProofCompetenceReport extends _$ProofCompetenceReport {
  @override
  Future<GetProofCompetenceReportResponse> build(
      {required String quizId, String? studentId}) async {
    return _fetchReports(quizId: quizId, studentId: studentId);
  }

  Future<GetProofCompetenceReportResponse> _fetchReports(
      {required String quizId, String? studentId}) async {
    Fimber.d("  REQUEST $studentId");
    final repository = ref.watch(reportRepositoryProvider);
    return repository.getProofCompetenceReportResult(quizId, studentId);
  }

  Future<void> refresh({required String quizId, String? studentId}) async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _fetchReports(quizId: quizId, studentId: studentId));
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}

@riverpod
class IntroductionProgressReport extends _$IntroductionProgressReport {
  @override
  Future<List<IntroProofReportItem>> build({String? studentId}) async {
    return _fetchReports(studentId: studentId);
  }

  Future<List<IntroProofReportItem>> _fetchReports({String? studentId}) async {
    Fimber.d("  REQUEST $studentId");
    final repository = ref.watch(reportRepositoryProvider);
    return studentId == null
        ? repository.getIntroductionProofReportProgress()
        : repository.getIntroductionProofReportProgressStudent(studentId);
  }

  Future<void> refresh({String? studentId}) async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchReports(studentId: studentId));
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}
