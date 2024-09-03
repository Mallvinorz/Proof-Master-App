import 'package:proofmaster/app/data/responses/student/get_report_progress/get_report_progress.dart';

abstract class ReportRepository {
  Future<GetReportProgress> getReportProgress();
}
