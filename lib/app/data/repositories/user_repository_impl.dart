import 'package:proofmaster/app/data/responses/general/get_user/get_user_response/get_user_response.dart';
import 'package:proofmaster/app/domain/repositories/user_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/app/utils/shared_pref.dart';
import 'package:proofmaster/constanta.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<GetUserResponse> getUser() async {
    try {
      final authToken = (await pref).getString(AUTH_TOKEN);
      final role = (await pref).getString(ROLE);

      // final queries = {
      //   'id': role == 'STUDENT'
      //       ? '66bfdd15-f55d-4b86-af23-2bca24445dc5'
      //       : role == "TEACHER"
      //           ? '0759f0bb-0a82-4826-931b-4b9b1f6a29be'
      //           : null
      // };

      final url = Uri.http(BASEURL, 'api/users/profile');

      final response = await httpClientWithInterceptor.get(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': "Bearer $authToken",
        },
      );
      final result = GetUserResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
