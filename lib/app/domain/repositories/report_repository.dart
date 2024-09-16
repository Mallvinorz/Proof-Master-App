import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';

abstract class ReportRepository {
  Future<List<ReportItem>> getReportProgress();
  Future<List<ReportItem>> getReportProgressStudent(String studentId);
  Future<GetIntroductionProofResponse> getIntroductionProofReportProgress();
  Future<GetIntroductionProofResponse>
      getIntroductionProofReportProgressStudent(String studentId);
}
