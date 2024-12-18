import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/repositories/onboarding_repository_impl.dart';
import 'package:proofmaster/app/domain/repositories/onboarding_repository.dart';
import 'package:proofmaster/app/presentation/providers/auth_provider/auth_provider.dart';
import 'package:proofmaster/app/utils/shared_pref.dart';
import 'package:proofmaster/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_route_provider.g.dart';

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  return OnboardingRepositoryImpl();
}

@riverpod
class InitialRoute extends _$InitialRoute {
  @override
  Future<String> build() async {
    return getInitialRoute();
  }

  Future<String> getInitialRoute() async {
    final onBoardingRepository = ref.watch(onboardingRepositoryProvider);
    final authRepository = ref.watch(authRepositoryProvider);
    final onboardStatusFinished = await onBoardingRepository.getOnboardStatus();

    if (!onboardStatusFinished) {
      return ProofmasterRoute.onBoarding;
    } else {
      final savedUsername = (await pref).getString(SAVED_EMAIL);
      final savedPassword = (await pref).getString(SAVED_PASSWORD);

      Fimber.d("email $savedUsername password $savedPassword");
      if ((savedPassword == null && savedUsername == null) ||
          (savedPassword == "" && savedUsername == "")) {
        return ProofmasterRoute.auth;
      }

      final authToken = await authRepository.getAuthToken();
      if (authToken != null) {
        final role = await authRepository.getRole();
        if (role == "STUDENT") {
          return ProofmasterRoute.home;
        }
        if (role == "TEACHER") {
          return ProofmasterRoute.lecturerHome;
        }
      }
      return ProofmasterRoute.auth;
    }
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => getInitialRoute());
  }
}
