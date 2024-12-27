import 'package:proofmaster/app/data/responses/student/get_dashboard_menus_response/datum.dart';
import 'package:proofmaster/app/data/responses/student/get_dashboard_menus_response/get_dashboard_menus_response.dart';
import 'package:proofmaster/app/domain/entities/material/learning_material.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/dashboard_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/constanta.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<List<MenuItem>> getStudentMenus() async {
    try {
      final uri = Uri.http(BASEURL, "/api/dashboard");
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final result = GetDashboardMenusResponse.fromJson(response.body);

      Map<String, List<Datum>> groupedData = {};

      if (result.data == null) {
        throw Exception("Fail to get dashboard menu progress");
      }

      for (var item in result.data!) {
        String category = item.category!;
        if (!groupedData.containsKey(category)) {
          groupedData[category] = [];
        }
        groupedData[category]!.add(item);
      }
      return convertMapToMenuItems(groupedData);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    httpClientWithInterceptor.close();
  }

  List<MenuItem> convertMapToMenuItems(Map<String, List<Datum>> inputMap) {
    List<MenuItem> result = [];

    inputMap.forEach((category, items) {
      // Add category separator
      result.add(MenuItem(
        isSeparator: true,
        separatorText: category,
        category: category,
      ));

      // Add items
      result.addAll(items.map(
        (item) => MenuItem(
            isSeparator: false,
            iconUrl: item.icUrl ?? "-",
            menuText: item.title,
            menuDesc: item.desc,
            route: item.endpoint,
            category: category,
            learningMaterial: LearningMaterial(
                name: item.title ?? "-",
                desc: item.desc ?? "-",
                totalSubLearningMaterial: item.totalMaterials ?? 0,
                finishedSubLearningMaterial: item.finishedMaterials ?? 0,
                isLocked: item.isLocked ?? true)),
      ));
    });

    return result;
  }
}
