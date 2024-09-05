import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';

abstract class IntroductionProofRepository {
  Future<GetIntroductionProofResponse> getMenuItems();
  void dispose();
}
