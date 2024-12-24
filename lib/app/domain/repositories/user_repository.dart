import 'package:proofmaster/app/data/responses/general/get_user/get_user_response/get_user_response.dart';
import 'package:proofmaster/app/data/responses/general/update_image_response.dart';
import 'package:proofmaster/app/domain/entities/change_pfp_dto/changepfpdto.dart';

abstract class UserRepository {
  Future<GetUserResponse> getUser();
  Future<UpdatePfpResponse> updatePfp(ChangePfpDto changePfpDto);
  Future<void> deleteAccount();
}
