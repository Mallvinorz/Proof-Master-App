import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/auth_repository_impl.dart';
import 'package:proofmaster/app/data/repositories/onboarding_repository_impl.dart';
import 'package:proofmaster/app/domain/repositories/auth_repository.dart';
import 'package:proofmaster/app/domain/repositories/onboarding_repository.dart';
import 'package:proofmaster/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_route_provider.g.dart';

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  return OnboardingRepositoryImpl();
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(http.Client());
}

@riverpod
Future<String> getInitialRoute(GetInitialRouteRef ref) async {
  final onBoardingRepository = ref.watch(onboardingRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final onboardStatusFinished = await onBoardingRepository.getOnboardStatus();

  if (!onboardStatusFinished) {
    return ProofmasterRoute.onBoarding;
  } else {
    if (await authRepository.getAuthToken() != null) {
      if (await authRepository.getRole() == "STUDENT") {
        return ProofmasterRoute.home;
      }
      if (await authRepository.getRole() == "TEACHER") {
        return ProofmasterRoute.lecturerHome;
      }
      return ProofmasterRoute.auth;
    } else {
      return ProofmasterRoute.auth;
    }
  }
}
