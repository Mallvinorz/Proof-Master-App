// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:proofmaster/app/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final Future<SharedPreferencesWithCache> _pref =
      SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions(
              // This cache will only accept the key 'counter'.
              allowList: <String>{'onboard_status'}));

  @override
  Future<bool> getOnboardStatus() async {
    return (await _pref).getBool('onboard_status') ?? false;
  }

  @override
  Future<void> setOnboardStatus(bool status) async {
    (await _pref).setBool('onboard_status', status);
  }
}
