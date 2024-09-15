import 'package:flutter/material.dart';
import 'package:proofmaster/app/templates/report/understanding_proof/detail/widgets/detail_activity_report_content.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';

class DetailActivityReportView extends StatelessWidget {
  final String? studentId;
  final String title;
  const DetailActivityReportView({
    super.key,
    required this.title,
    this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: title,
      mainChildren: DetailActivityReportContent(
        studentId: studentId,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
    );
  }
}
