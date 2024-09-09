// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:proofmaster/app/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:proofmaster/app/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  Future<bool> getOnboardStatus() async {
    return (await pref).getBool('onboard_status') ?? false;
  }

  @override
  Future<void> setOnboardStatus(bool status) async {
    (await pref).setBool('onboard_status', status);
  }
}
