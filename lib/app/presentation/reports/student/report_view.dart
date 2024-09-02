import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/reports/student/widgets/report_content.dart';
import 'package:proofmaster/app/presentation/reports/student/widgets/top_children_view.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      topChildren: TopChildrenView(),
      mainChildren: ReportContent(),
    );
  }
}
