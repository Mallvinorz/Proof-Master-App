import 'package:proofmaster/app/data/responses/general/get_diagnostic_report/get_diagnostic_report_response/get_diagnostic_report_response.dart';
import 'package:proofmaster/app/data/responses/general/get_proof_competence_report_result/get_proof_competence_report_response/get_proof_competence_report_response.dart';
import 'package:proofmaster/app/domain/entities/intro_proof_report_item/intro_proof_report_item.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';

abstract class ReportRepository {
  Future<List<ReportItem>> getReportProgress();
  Future<List<ReportItem>> getReportProgressStudent(String studentId);
  Future<List<IntroProofReportItem>> getIntroductionProofReportProgress();
  Future<List<IntroProofReportItem>> getIntroductionProofReportProgressStudent(
      String studentId);
  Future<GetDiagnosticReportResponse> getDiagnosticReport(String quizId);
  Future<GetDiagnosticReportResponse> getDiagnosticReportFromStudent(
      String quizId, String studentId);
  Future<GetProofCompetenceReportResponse> getProofCompetenceReportResult(
      String quizId, String? studentId);
}
