import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:proofmaster/app/data/repositories/auth_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/auth_dto/authdto.dart';
import 'package:proofmaster/app/utils/jwt_decoder.dart';
import 'package:proofmaster/app/utils/shared_pref.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    print('Request:');
    print('Method: ${request.method}');
    print('URL: ${request.url}');
    print('Headers: ${request.headers}');

    String? jwtToken = (await pref).getString(AUTH_TOKEN) ?? "";
    final decodedJwt = JWTDecoder.decodeJwt(jwtToken);
    final DateTime jwtExpDateTime =
        DateTime.fromMillisecondsSinceEpoch(decodedJwt['exp'] * 1000);

    if (DateTime.now().toUtc().isAfter(jwtExpDateTime.toUtc())) {
      Fimber.d("requesting new access token");
      await refreshToken();
      return request;
    }
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
        await refreshToken();
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refreshToken() async {
    final savedUsername = (await pref).getString(SAVED_EMAIL);
    final savedPassword = (await pref).getString(SAVED_PASSWORD);
    final authRepository = AuthRepositoryImpl();

    final authDto =
        AuthDTO(email: savedUsername ?? "", password: savedPassword ?? "");
    await authRepository.signin(authDto);
  }

  @override
  FutureOr<bool> shouldInterceptRequest() => true;

  @override
  FutureOr<bool> shouldInterceptResponse() => true;
}
