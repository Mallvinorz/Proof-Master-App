// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:proofmaster/app/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Future<SharedPreferencesWithCache> _pref =
      SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions(
              // This cache will only accept the key 'counter'.
              allowList: <String>{'onboard_status', 'auth-token', 'role'}));

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
  Future<void> signup(String email, String password) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<String?> getRole() async {
    return (await _pref).getString('role');
  }
}
