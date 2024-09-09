import 'package:proofmaster/app/data/responses/general/get_user/get_user_response/get_user_response.dart';

abstract class UserRepository {
  Future<GetUserResponse> getUser();
}
