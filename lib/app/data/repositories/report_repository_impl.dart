import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/responses/general/get_diagnostic_report/get_diagnostic_report_response/get_diagnostic_report_response.dart';
import 'package:proofmaster/app/data/responses/general/get_learning_material_progress_report/get_learning_material_progress_report_response/get_learning_material_progress_report_response.dart';
import 'package:proofmaster/app/data/responses/general/get_proof_competence_report_result/get_proof_competence_report_response/get_proof_competence_report_response.dart';
import 'package:proofmaster/app/data/responses/general/get_report_progress/get_report_progress.dart';
import 'package:proofmaster/app/domain/entities/intro_proof_report_item/intro_proof_report_item.dart';
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
  Future<List<IntroProofReportItem>>
      getIntroductionProofReportProgress() async {
    final uri = Uri.http(BASEURL, "api/users/learning-material/progress");
    final response = await httpClientWithInterceptor.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final result =
        GetLearningMaterialProgressReportResponse.fromJson(response.body);
    return result.data?.items
            ?.map((item) => IntroProofReportItem(
                  text: item.text ?? "",
                  finishedCount: item.finishedCount ?? 0,
                  totalCount: item.totalCount ?? 0,
                ))
            .toList() ??
        [];
  }

  @override
  Future<List<IntroProofReportItem>> getIntroductionProofReportProgressStudent(
      String studentId) async {
    final uri = Uri.http(BASEURL, "api/learning-material/progress/$studentId");
    final response = await httpClientWithInterceptor.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final result =
        GetLearningMaterialProgressReportResponse.fromJson(response.body);
    return result.data?.items
            ?.map((item) => IntroProofReportItem(
                  text: item.text ?? "",
                  finishedCount: item.finishedCount ?? 0,
                  totalCount: item.totalCount ?? 0,
                ))
            .toList() ??
        [];
  }

  @override
  Future<GetDiagnosticReportResponse> getDiagnosticReport(String quizId) async {
    try {
      final uri = Uri.http(BASEURL, "api/reports/diagnostics/$quizId");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

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

      Fimber.d("response get diagnostic report $response");
      final result = GetDiagnosticReportResponse.fromJson(response.body);

      Fimber.d("response get diagnostic report result $result");
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

      if (response.statusCode == 500) {
        throw Exception("from server when get report data");
      }
      if (response.statusCode == 404) {
        throw Exception("no report data");
      }
      final result = GetProofCompetenceReportResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
