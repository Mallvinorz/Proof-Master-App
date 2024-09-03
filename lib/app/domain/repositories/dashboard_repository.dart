import 'package:proofmaster/app/data/responses/student/get_dashboard_menus_response/get_dashboard_menus_response.dart';

abstract class DashboardRepository {
  Future<GetDashboardMenusResponse> getMenus();
}
