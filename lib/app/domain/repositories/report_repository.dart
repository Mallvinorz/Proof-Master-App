import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';

abstract class ReportRepository {
  Future<List<ReportItem>> getReportProgress();
  Future<List<ReportItem>> getReportProgressStudent(String studentId);
}
