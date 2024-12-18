import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/presentation/templates/report/understanding_proof/detail/widgets/detail_activity_report_content.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';

class DetailActivityReportView extends ConsumerWidget {
  final String? activityId;
  final String? studentId;
  final String title;
  const DetailActivityReportView({
    super.key,
    required this.title,
    this.activityId,
    this.studentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundPattern(
      appBarTitle: title,
      mainChildren: DetailActivityReportContent(
        activityId: activityId,
        studentId: studentId,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
    );
  }
}
