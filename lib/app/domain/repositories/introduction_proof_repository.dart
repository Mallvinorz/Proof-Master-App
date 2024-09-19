import 'package:proofmaster/app/data/responses/student/finished_reading_introduction_material_response.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';

abstract class IntroductionProofRepository {
  Future<List<MenuItem>> getMenuItems();
  Future<FinishedReadingIntroductionMaterialResponse> finishedReadingMaterial(
      String materialId);
  void dispose();
}
