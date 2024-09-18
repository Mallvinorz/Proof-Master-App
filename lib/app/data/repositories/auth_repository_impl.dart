import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/general/auth_reponse/auth_reponse.dart';
import 'package:proofmaster/app/data/responses/general/reset_password_response.dart';
import 'package:proofmaster/app/data/responses/student/register_succes_reponse.dart';
import 'package:proofmaster/app/domain/entities/auth_dto/authdto.dart';
import 'package:proofmaster/app/domain/entities/register_dto/registerdto.dart';
import 'package:proofmaster/app/domain/entities/reset_password_dto/resetpassworddto.dart';
import 'package:proofmaster/app/domain/repositories/auth_repository.dart';
import 'package:proofmaster/app/utils/shared_pref.dart';
import 'package:proofmaster/constanta.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<String?> getAuthToken() async {
    return (await pref).getString(AUTH_TOKEN);
  }

  @override
  Future<AuthReponse> signin(AuthDTO authDto) async {
    try {
      final url = Uri.http(BASEURL, 'api/users/login');
      final response = await http.Client().post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
        },
        body: authDto.toJson(),
      );
      final result = AuthReponse.fromJson(response.body);

      Fimber.d("email ${authDto.email}");
      Fimber.d("password ${authDto.password}");

      (await pref).setString(AUTH_TOKEN, result.data?.token ?? "");
      (await pref).setString(ROLE, result.data?.role ?? "");
      (await pref).setString(SAVED_EMAIL, authDto.email);
      (await pref).setString(SAVED_PASSWORD, authDto.password);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterSuccesReponse> signup(RegisterDTO registerDto) async {
    try {
      final url = Uri.http(BASEURL, 'api/users');
      print(registerDto.toJson());
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
      final url = Uri.http(BASEURL, 'api/users/reset-password');
      final resetPasswordDto = ResetPasswordDto(email: email);
      final response = await http.Client().post(
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
