import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/responses/student/register_succes_reponse.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:proofmaster/app/domain/entities/register_dto/registerdto.dart';
import 'package:proofmaster/app/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Future<SharedPreferencesWithCache> _pref =
      SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions(
              // This cache will only accept the key 'counter'.
              allowList: <String>{'onboard_status', 'auth-token', 'role'}));

  AuthRepositoryImpl(this.client);
  final http.Client client;

  @override
  Future<String?> getAuthToken() async {
    return (await _pref).getString('auth-token');
  }

  @override
  Future<void> signin(String email, String password) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<RegisterSuccesReponse> signup(RegisterDTO registerDto) async {
    try {
      final queries = {'id': 'id=8c5fe74b-73c7-47c5-9152-913bf5cba1a1'};
      final url =
          Uri.https('oh-my-api-seven.vercel.app', 'api/end-to-end', queries);
      final response = await client.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer haha',
        },
        body: registerDto.toJson(),
      );
      final result = RegisterSuccesReponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getRole() async {
    return (await _pref).getString('role');
  }
}
