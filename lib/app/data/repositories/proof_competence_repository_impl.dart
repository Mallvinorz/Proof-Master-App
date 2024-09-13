import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/get_proof_competence_response/get_proof_competence_quiz_menus/get_proof_competence_quiz_menus.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/proof_competence_repository.dart';

class ProofCompetenceRepositoryImpl implements ProofComptenceRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';
  ProofCompetenceRepositoryImpl(this.client);
  final http.Client client;

  @override
  Future<List<MenuItem>> getProofCompetenceMenus() async {
    try {
      final queries = {'id': '30d86602-d375-4cda-abac-1539e93778c6'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
      });
      final result = GetProofCompetenceQuizMenus.fromJson(response.body);

      if (result.data == null) {
        throw Exception("Fail to get proof competence quiz menu progress");
      }

      print(result.data?.items);

      return result.data?.items
              ?.map(
                (item) => MenuItem(
                    isSeparator: false,
                    iconUrl: 'assets/icons/test_ic.png',
                    menuText: item?.menuText ?? "-",
                    menuDesc: item.menuDesc ?? "-",
                    route: item.id ?? "-"),
              )
              .toList() ??
          [];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  void dispose() {
    client.close();
  }
}
