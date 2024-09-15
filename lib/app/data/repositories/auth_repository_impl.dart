import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/responses/general/auth_reponse/auth_reponse.dart';
import 'package:proofmaster/app/data/responses/general/reset_password_response.dart';
import 'package:proofmaster/app/data/responses/student/register_succes_reponse.dart';
import 'package:proofmaster/app/domain/entities/auth_dto/authdto.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:proofmaster/app/domain/entities/register_dto/registerdto.dart';
import 'package:proofmaster/app/domain/entities/resetpassworddto.dart';
import 'package:proofmaster/app/domain/repositories/auth_repository.dart';
import 'package:proofmaster/app/helper/http_client.dart';
import 'package:proofmaster/app/utils/shared_pref.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<String?> getAuthToken() async {
    return (await pref).getString(AUTH_TOKEN);
  }

  @override
  Future<AuthReponse> signin(AuthDTO authDto) async {
    try {
      // const teacherLoginKey = 'loginteacher';
      // final queries = {
      //   'id': (authDto.password == teacherLoginKey
      //       ? '623303b8-7208-4433-80bb-f26fb0d248d3'
      //       : 'f63a10e8-585e-4b20-8e8d-0bf67f0439d4')
      // };
      // final url =
      //     Uri.https('oh-my-api-seven.vercel.app', 'api/end-to-end', queries);
      final url = Uri.http('43.228.213.172:3000', 'api/users/login');
      final response = await httpClientWithInterceptor.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
        },
        body: authDto.toJson(),
      );
      final result = AuthReponse.fromJson(response.body);

      print("result $result");
      (await pref).setString(AUTH_TOKEN, result.data?.token ?? "");
      (await pref).setString(ROLE, result.data?.role ?? "");

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterSuccesReponse> signup(RegisterDTO registerDto) async {
    try {
      final url = Uri.http('43.228.213.172:3000', 'api/users');
      print(registerDto.toJson());
      // throw Exception("ngentod");
      final response = await http.Client().post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
        },
        body: registerDto.toJson(),
      );
      if (response.statusCode != 200) throw Exception(response.body);
      final result = RegisterSuccesReponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getRole() async {
    return (await pref).getString(ROLE);
  }

  @override
  Future<void> signout() async {
    (await pref).setString(AUTH_TOKEN, '');
    (await pref).setString(ROLE, '');
  }

  @override
  Future<ResetPasswordResponse> resetPassword(String email) async {
    try {
      final url = Uri.http('43.228.213.172:3000', 'api/users/reset-password');
      final resetPasswordDto = ResetPasswordDto(email: email);
      final response = await httpClientWithInterceptor.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
        },
        body: resetPasswordDto.toJson(),
      );

      if (response.statusCode != 200) throw Exception(response.body);
      final result = ResetPasswordResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
