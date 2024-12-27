import 'package:http/http.dart' as http;
import 'package:fimber/fimber.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:proofmaster/app/data/responses/general/get_user/get_user_response/get_user_response.dart';
import 'package:proofmaster/app/data/responses/general/update_image_response.dart';
import 'package:proofmaster/app/domain/entities/change_pfp_dto/changepfpdto.dart';
import 'package:proofmaster/app/domain/repositories/user_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/app/helper/interceptor.dart';
import 'package:proofmaster/constanta.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<GetUserResponse> getUser() async {
    try {
      // final authToken = (await pref).getString(AUTH_TOKEN);
      // final role = (await pref).getString(ROLE);

      final url = Uri.http(BASEURL, 'api/users/profile');

      final response = await httpClientWithInterceptor.get(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          // 'Authorization': "Bearer $authToken",
        },
      );
      final result = GetUserResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdatePfpResponse> updatePfp(ChangePfpDto changePfpDto) async {
    try {
      final url = Uri.http(BASEURL, "api/users/update-photo");

      // Create a custom client with our interceptor
      final client = InterceptedClient.build(interceptors: [AuthInterceptor()]);

      final request = http.MultipartRequest('PATCH', url);
      Map<String, String> requestBody = <String, String>{};

      final filename = "${DateTime.now()}pfp.png";

      request.files.add(http.MultipartFile(
        'photo',
        changePfpDto.imageFile.readAsBytes().asStream(),
        changePfpDto.imageFile.lengthSync(),
        filename: filename,
      ));
      request.fields.addAll(requestBody);

      final streamedResponse = await client.send(request);
      var response = await http.Response.fromStream(streamedResponse);

      Fimber.d("response from repository $response");
      print(response.body);

      if (response.statusCode == 200) {
        final result = UpdatePfpResponse.fromJson(response.body);
        return result;
      } else {
        throw Exception(
            'Failed to upload file and register. Status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
