import 'package:proofmaster/app/data/responses/general/auth_reponse/auth_reponse.dart';
import 'package:proofmaster/app/data/responses/student/register_succes_reponse.dart';
import 'package:proofmaster/app/domain/entities/auth_dto/authdto.dart';
import 'package:proofmaster/app/domain/entities/register_dto/registerdto.dart';

abstract class AuthRepository {
  Future<String?> getAuthToken();
  Future<String?> getRole();
  Future<AuthReponse> signin(AuthDTO authDto, String password);
  Future<RegisterSuccesReponse> signup(RegisterDTO registerDto);
}
