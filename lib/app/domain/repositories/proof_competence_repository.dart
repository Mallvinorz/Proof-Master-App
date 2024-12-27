import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';

abstract class ProofComptenceRepository {
  Future<List<MenuItem>> getProofCompetenceMenus();
  void dispose();
}
