import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/report_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';
import 'package:proofmaster/app/domain/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_provider.g.dart';

@riverpod
ReportRepository reportRepository(ReportRepositoryRef ref) {
  return ReportRepositoryImpl(http.Client());
}

@riverpod
Future<List<ReportItem>> getReportProgress(GetReportProgressRef ref) {
  return ref.watch(reportRepositoryProvider).getReportProgress();
}

@riverpod
Future<List<ReportItem>> getStudentReportProgress(
    GetReportProgressRef ref, String studentId) {
  return ref
      .watch(reportRepositoryProvider)
      .getReportProgressStudent(studentId);
}
