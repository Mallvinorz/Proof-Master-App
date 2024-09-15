import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:proofmaster/app/data/repositories/auth_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/auth_dto/authdto.dart';
import 'package:proofmaster/app/utils/shared_pref.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    print('Request:');
    print('Method: ${request.method}');
    print('URL: ${request.url}');
    print('Headers: ${request.headers}');
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    try {
      print('Response:');
      print('Status: ${response.statusCode}');
      print('Headers: ${response.headers}');

      if (response.statusCode == 401) {
        final savedUsername = (await pref).getString(SAVED_EMAIL);
        final savedPassword = (await pref).getString(SAVED_PASSWORD);
        final authRepository = AuthRepositoryImpl();

        final authDto =
            AuthDTO(email: savedUsername ?? "", password: savedPassword ?? "");
        await authRepository.signin(authDto);
      }
      // if (response is Response) {
      //   print('Body: ${response.body}');
      //   if (response.statusCode != 200) throw Exception(response);
      // }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<bool> shouldInterceptRequest() => true;

  @override
  FutureOr<bool> shouldInterceptResponse() => true;
}
