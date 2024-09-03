import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/get_report_progress/get_report_progress.dart';
import 'package:proofmaster/app/domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';
  ReportRepositoryImpl(this.client);
  final http.Client client;

  @override
  Future<GetReportProgress> getReportProgress() async {
    try {
      final queries = {'id': 'be3caf25-6716-473d-bcb6-e2bc6287c4be'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
      });
      final result = GetReportProgress.fromJson(response.body);
      print(result);
      return result;
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }
}
