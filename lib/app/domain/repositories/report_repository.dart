import 'package:proofmaster/app/data/responses/general/get_diagnostic_report/get_diagnostic_report_response/get_diagnostic_report_response.dart';
import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';

abstract class ReportRepository {
  Future<List<ReportItem>> getReportProgress();
  Future<List<ReportItem>> getReportProgressStudent(String studentId);
  Future<GetIntroductionProofResponse> getIntroductionProofReportProgress();
  Future<GetIntroductionProofResponse>
      getIntroductionProofReportProgressStudent(String studentId);
  Future<GetDiagnosticReportResponse> getDiagnosticReport(String quizId);
  Future<GetDiagnosticReportResponse> getDiagnosticReportFromStudent(
      String quizId, String studentId);
}
