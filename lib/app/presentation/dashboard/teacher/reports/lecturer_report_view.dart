import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/dashboard/teacher/reports/widgets/top_banner_lecturer_report.dart';
import 'package:proofmaster/app/presentation/dashboard/student/report/report_view.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';

class LecturerReportView extends StatelessWidget {
  final String studentId;
  const LecturerReportView({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Laporan Pembelajaran",
      topChildren: const TopBannerLecturerReport(),
      mainChildren: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ReportView(
          studentId: studentId,
        ),
      ),
    );
  }
}
