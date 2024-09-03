import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/reports/student/understanding_proof/detail/widgets/detail_activity_report_content.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';

class DetailActivityReportView extends StatelessWidget {
  const DetailActivityReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Aktivitas 1",
      mainChildren: const DetailActivityReportContent(),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
    );
  }
}
