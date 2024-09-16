import 'package:proofmaster/app/data/responses/student/finished_reading_introduction_material_response.dart';
import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';

abstract class IntroductionProofRepository {
  Future<GetIntroductionProofResponse> getMenuItems();
  Future<FinishedReadingIntroductionMaterialResponse> finishedReadingMaterial(
      String materialId);
  void dispose();
}
