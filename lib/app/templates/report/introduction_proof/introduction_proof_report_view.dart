import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/intro_proof_report_item/intro_proof_report_item.dart';
import 'package:proofmaster/app/templates/report/introduction_proof/widgets/item.dart';
import 'package:proofmaster/app/templates/list_item_template.dart';
import 'package:proofmaster/app/utils/ui_state.dart';

class IntroductionProofReportView extends StatelessWidget {
  final String? studentId;
  const IntroductionProofReportView({super.key, this.studentId});

  Future<UIState<List<IntroProofReportItem>>> getDummyData() {
    final dummy = [
      IntroProofReportItem(finishedCount: 10, text: "Logika", totalCount: 10),
      IntroProofReportItem(finishedCount: 10, text: "Teorema", totalCount: 10),
      IntroProofReportItem(finishedCount: 10, text: "Axioma", totalCount: 10),
      IntroProofReportItem(
          finishedCount: 10, text: "Definition of Terms", totalCount: 10),
      IntroProofReportItem(
          finishedCount: 10, text: "Geometric Proof", totalCount: 10),
    ];
    return Future.value(UISuccess(dummy));
  }

  @override
  Widget build(BuildContext context) {
    return ListItemTemplate<IntroProofReportItem>(
      title: "Introduction to Proof Report",
      futureData: getDummyData(),
      onLoadData: () {},
      child: (IntroProofReportItem data) => Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: IntroductionProofItem(
            text: data.text,
            finished: data.finishedCount == data.totalCount,
            finishedCount: data.finishedCount,
            totalCount: data.totalCount),
      ),
    );
  }
}
