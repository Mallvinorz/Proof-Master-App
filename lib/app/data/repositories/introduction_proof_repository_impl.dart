import 'package:proofmaster/app/data/responses/student/finished_reading_introduction_material_response.dart';
import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/introduction_proof_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/constanta.dart';

class IntroductionProofRepositoryImpl implements IntroductionProofRepository {
  @override
  void dispose() {
    httpClientWithInterceptor.close();
  }

  @override
  Future<List<MenuItem>> getMenuItems() async {
    try {
      final uri = Uri.http(BASEURL, "api/learning-materials");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      //  MenuItem(
      //   route: 'geometric-proof',
      //   iconUrl: 'assets/icons/geometric_ic.png',
      //   isSeparator: false,
      //   menuText: "Geometric Proof",
      //   menuDesc: "Lorem ipsum dolor sit amet consectetur.",
      // ),

      final result = GetIntroductionProofResponse.fromJson(response.body);
      final menus = result.data
          ?.map((item) => MenuItem(
              isSeparator: false,
              route: item.id ?? "",
              iconUrl: item.icUrl ?? "",
              menuText: item.title ?? "",
              pdfUrl: item.pdfUrl,
              menuDesc: item.desc ?? ""))
          .toList();
      return menus ?? [];
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
