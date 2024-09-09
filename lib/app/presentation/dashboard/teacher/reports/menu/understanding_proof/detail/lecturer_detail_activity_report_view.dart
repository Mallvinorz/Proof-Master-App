import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/dashboard/teacher/reports/menu/understanding_proof/detail/widgets/lecturer_detail_activity_report_content.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';

class LecturerDetailActivityReportView extends StatelessWidget {
  const LecturerDetailActivityReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Aktivitas 1",
      mainChildren: const LecturerDetailActivityReportContent(),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
    );
  }
}
