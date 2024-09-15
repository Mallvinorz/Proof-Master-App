import 'package:proofmaster/app/data/responses/general/get_report_progress/get_report_progress.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';
import 'package:proofmaster/app/domain/repositories/report_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';

class ReportRepositoryImpl implements ReportRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';

  @override
  Future<List<ReportItem>> getReportProgress() async {
    try {
      final queries = {'id': '3afe4629-8c4c-4f6e-950c-729f0de02c78'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
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
      final queries = {'id': '3afe4629-8c4c-4f6e-950c-729f0de02c78'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
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
}
