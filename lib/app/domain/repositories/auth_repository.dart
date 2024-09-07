abstract class AuthRepository {
  Future<String?> getAuthToken();
  Future<String?> getRole();
  Future<void> signin(String email, String password);
  Future<void> signup(String email, String password);
}
