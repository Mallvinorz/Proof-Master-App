import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/user_repository_impl.dart';
import 'package:proofmaster/app/data/responses/general/get_user/get_user_response/get_user_response.dart';
import 'package:proofmaster/app/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(http.Client());
}

@Riverpod(keepAlive: true)
class IsRefreshing extends _$IsRefreshing {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  Future<GetUserResponse> build() async {
    return _fetchUserReponse();
  }

  Future<GetUserResponse> _fetchUserReponse() async {
    final repository = ref.watch(userRepositoryProvider);
    return repository.getUser();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchUserReponse());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}
