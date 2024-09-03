import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/get_dashboard_menus_response/get_dashboard_menus_response.dart';
import 'package:proofmaster/app/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final _baseUrl = 'oh-my-api-seven.vercel.app';
  DashboardRepositoryImpl(this.client);
  final http.Client client;

  @override
  Future<GetDashboardMenusResponse> getMenus() async {
    try {
      final queries = {'id': '9bf12af0-198b-497f-aae1-e5038b696abe'};
      final uri = Uri.https(_baseUrl, "api/end-to-end", queries);
      print(uri);
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer haha',
      });
      final result = GetDashboardMenusResponse.fromJson(response.body);
      print(result);
      return result;
    } catch (e) {
      throw e;
    } finally {
      client.close();
    }
  }
}
