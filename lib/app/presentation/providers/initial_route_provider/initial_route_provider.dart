import 'package:proofmaster/app/data/repositories/onboarding_repository_impl.dart';
import 'package:proofmaster/app/domain/repositories/onboarding_repository.dart';
import 'package:proofmaster/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_route_provider.g.dart';

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  return OnboardingRepositoryImpl();
}

@riverpod
Future<String> getInitialRoute(GetInitialRouteRef ref) async {
  final onBoardingRepository = ref.watch(onboardingRepositoryProvider);
  final onboardStatus = await onBoardingRepository.getOnboardStatus();

  return onboardStatus ? ProofmasterRoute.auth : ProofmasterRoute.onBoarding;
}
