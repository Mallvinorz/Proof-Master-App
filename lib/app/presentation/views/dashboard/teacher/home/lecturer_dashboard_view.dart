import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/home/widgets/lecturer_dashboard_content.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/home/widgets/top_banner_lecturer_dashboard.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';

class LecturerDashboardView extends StatelessWidget {
  const LecturerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
        topChildren: const TopBannerLecturerDashboard(),
        mainChildren: const LecturerDashboardContent());
  }
}
