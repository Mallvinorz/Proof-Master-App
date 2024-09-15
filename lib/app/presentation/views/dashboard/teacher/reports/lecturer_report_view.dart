import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/reports/widgets/top_banner_lecturer_report.dart';
import 'package:proofmaster/app/presentation/templates/report/report_view.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';

class LecturerReportView extends StatelessWidget {
  final String studentId;
  final String studentName;
  const LecturerReportView(
      {super.key, required this.studentId, required this.studentName});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Laporan Pembelajaran",
      topChildren: TopBannerLecturerReport(
        studentName: studentName,
      ),
      mainChildren: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ReportView(
          studentId: studentId,
        ),
      ),
    );
  }
}
