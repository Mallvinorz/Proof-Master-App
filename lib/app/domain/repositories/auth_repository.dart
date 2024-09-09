import 'package:proofmaster/app/data/responses/student/register_succes_reponse.dart';
import 'package:proofmaster/app/domain/entities/register_dto/registerdto.dart';

abstract class AuthRepository {
  Future<String?> getAuthToken();
  Future<String?> getRole();
  Future<void> signin(String email, String password);
  Future<RegisterSuccesReponse> signup(RegisterDTO registerDto);
}
