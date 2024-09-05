import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';
import 'package:proofmaster/app/domain/repositories/introduction_proof_repository.dart';

class IntroductionProofRepositoryImpl implements IntroductionProofRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';
  IntroductionProofRepositoryImpl(this.client);
  final http.Client client;

  @override
  void dispose() {
    client.close();
  }

  @override
  Future<GetIntroductionProofResponse> getMenuItems() async {
    try {
      final queries = {'id': '3e2ff29f-d31d-414b-8e4e-37a885255b2b'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
      });
      final result = GetIntroductionProofResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
