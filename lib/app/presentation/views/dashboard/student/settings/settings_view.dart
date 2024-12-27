import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/settings/widgets/settings_content.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/settings/widgets/top_banner_settings.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      topChildren: const TopBannerSettings(),
      mainChildren: const SettingsContent(),
    );
  }
}
