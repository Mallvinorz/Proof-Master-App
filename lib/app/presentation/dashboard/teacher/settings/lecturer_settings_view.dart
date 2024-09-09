import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/dashboard/student/settings/widgets/settings_content.dart';
import 'package:proofmaster/app/presentation/dashboard/teacher/settings/widgets/top_banner_lecturer_settings.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';

class LecturerSettingsView extends StatelessWidget {
  const LecturerSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Profil",
      topChildren: const TopBannerLecturerSettings(),
      mainChildren: const SettingsContent(),
    );
  }
}
