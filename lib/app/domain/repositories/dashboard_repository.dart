import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';

abstract class DashboardRepository {
  Future<List<MenuItem>> getStudentMenus();
  void dispose();
}
