import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/responses/general/get_diagnostic_report/get_diagnostic_report_response/get_diagnostic_report_response.dart';
import 'package:proofmaster/app/data/responses/general/get_proof_competence_report_result/get_proof_competence_report_response/get_proof_competence_report_response.dart';
import 'package:proofmaster/app/data/responses/general/get_report_progress/get_report_progress.dart';
import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';
import 'package:proofmaster/app/domain/repositories/report_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/constanta.dart';

class ReportRepositoryImpl implements ReportRepository {
  @override
  Future<List<ReportItem>> getReportProgress() async {
    try {
      final Uri uri = Uri.http(BASEURL, "api/progress");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final result = GetReportProgress.fromJson(response.body);

      return result.data?.reports
              ?.map((item) => ReportItem(
                  route: item.id ?? "-",
                  textTitle: item.title ?? "-",
                  progress: (item.finishedProgress?.toDouble() ?? 0.0) / 100))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ReportItem>> getReportProgressStudent(String studentId) async {
    try {
      final uri = Uri.http(BASEURL, "api/progress/$studentId");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      final result = GetReportProgress.fromJson(response.body);
      return result.data?.reports
              ?.map((item) => ReportItem(
                  route: item.id ?? "-",
                  textTitle: item.title ?? "-",
                  progress: (item.finishedProgress?.toDouble() ?? 0.0) / 100))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  void dispose() {
    httpClientWithInterceptor.close();
  }

  @override
  Future<GetIntroductionProofResponse> getIntroductionProofReportProgress() {
    // TODO: implement getIntroductionProofReportProgress
    throw UnimplementedError();
  }

  @override
  Future<GetIntroductionProofResponse>
      getIntroductionProofReportProgressStudent(String studentId) {
    // TODO: implement getIntroductionProofReportProgressStudent
    throw UnimplementedError();
  }

  @override
  Future<GetDiagnosticReportResponse> getDiagnosticReport(String quizId) async {
    try {
      final uri = Uri.http(BASEURL, "api/reports/diagnostics/$quizId");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      Fimber.d("response $response");
      final result = GetDiagnosticReportResponse.fromJson(response.body);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetDiagnosticReportResponse> getDiagnosticReportFromStudent(
      String quizId, String studentId) async {
    try {
      final uri =
          Uri.http(BASEURL, "api/reports/diagnostics/$quizId/$studentId");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      Fimber.d("response $response");
      final result = GetDiagnosticReportResponse.fromJson(response.body);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetProofCompetenceReportResponse> getProofCompetenceReportResult(
      String quizId, String? studentId) async {
    try {
      final uri = Uri.http(
          BASEURL,
          studentId != null
              ? "api/reports/competences/$quizId/$studentId"
              : "api/reports/competences/$quizId");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      Fimber.d("response $response");
      final result = GetProofCompetenceReportResponse.fromJson(response.body);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
