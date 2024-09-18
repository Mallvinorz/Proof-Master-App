import 'package:proofmaster/app/data/responses/student/finished_reading_introduction_material_response.dart';
import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';
import 'package:proofmaster/app/domain/repositories/introduction_proof_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';

class IntroductionProofRepositoryImpl implements IntroductionProofRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';

  @override
  void dispose() {
    httpClientWithInterceptor.close();
  }

  @override
  Future<GetIntroductionProofResponse> getMenuItems() async {
    try {
      final queries = {'id': '3e2ff29f-d31d-414b-8e4e-37a885255b2b'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer haha',
      });
      final result = GetIntroductionProofResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FinishedReadingIntroductionMaterialResponse> finishedReadingMaterial(
      String materialId) {
    // TODO: implement finishedReadingMaterial
    throw UnimplementedError();
  }
}
