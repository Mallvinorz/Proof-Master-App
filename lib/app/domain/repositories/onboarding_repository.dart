abstract class OnboardingRepository {
  Future<bool> getOnboardStatus();
  Future<void> setOnboardStatus(bool status);
}
