import 'package:proofmaster/app/data/responses/student/get_dashboard_menus_response/datum.dart';
import 'package:proofmaster/app/data/responses/student/get_dashboard_menus_response/get_dashboard_menus_response.dart';
import 'package:proofmaster/app/domain/entities/material/learning_material.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/dashboard_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';

  @override
  Future<List<MenuItem>> getStudentMenus() async {
    try {
      final queries = {'id': 'c0c653db-46a7-4f00-bbbf-7c99612b015d'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await httpClientWithInterceptor.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
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

      // print(convertMapToMenuItems(groupedData));

      // final menus = result.data!
      //     .map((item) => MenuItem(
      //         isSeparator: false,
      //         iconUrl: item.icUrl,
      //         route: item.endpoint,
      //         category: item.category,
      //         learningMaterial: LearningMaterial(
      //             name: item.title ?? "-",
      //             desc: item.desc ?? "-",
      //             totalSubLearningMaterial: item.totalMaterials ?? 0,
      //             finishedSubLearningMaterial: item.finishedMaterials ?? 0,
      //             isLocked: item.isLocked ?? true)))
      //     .toList();
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
