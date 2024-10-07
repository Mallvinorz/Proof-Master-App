import 'package:proofmaster/app/data/responses/student/get_proof_competence_response/get_proof_competence_quiz_menus/get_proof_competence_quiz_menus.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/proof_competence_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';

class ProofCompetenceRepositoryImpl implements ProofComptenceRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';

  @override
  Future<List<MenuItem>> getProofCompetenceMenus() async {
    try {
      final queries = {'id': '30d86602-d375-4cda-abac-1539e93778c6'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final result = GetProofCompetenceQuizMenus.fromJson(response.body);

      if (result.data == null) {
        throw Exception("Fail to get proof competence quiz menu progress");
      }

      return result.data?.items
              ?.map(
                (item) => MenuItem(
                    isSeparator: false,
                    iconUrl: "https://ik.imagekit.io/q1qexvvey/test_ic.png",
                    menuText: item.menuText ?? "-",
                    menuDesc: item.menuDesc ?? "-",
                    route: item.id ?? "-"),
              )
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    httpClientWithInterceptor.close();
  }
}
