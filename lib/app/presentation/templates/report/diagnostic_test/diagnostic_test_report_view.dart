import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/presentation/templates/list_item_template.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/app/presentation/widgets/clickable_item_with_icon.dart';

class DiagnosticTestReportView extends StatelessWidget {
  final String? studentId;
  const DiagnosticTestReportView({super.key, this.studentId});

  Future<UIState<List<ListItem>>> getDummyData() {
    final dummy = [
      ListItem(
          id: ProofmasterRoute.reportDiagnosticLearningModalitits,
          text: "Learning Modalities Test",
          iconUrl: "assets/icons/learning_ic.png"),
      ListItem(
          id: ProofmasterRoute.reportDiagnosticPriorKnowledge,
          text: "Prior Knowledge Test",
          iconUrl: "assets/icons/prior_ic.png"),
      ListItem(
          id: ProofmasterRoute.reportDiagnosticProofFormat,
          text: "Proof Format Preference Test",
          iconUrl: "assets/icons/proof_ic.png"),
    ];
    return Future.value(UISuccess(dummy));
  }

  @override
  Widget build(BuildContext context) {
    return ListItemTemplate<ListItem>(
      title: "Diagnostic Test Reports",
      futureData: getDummyData(),
      onLoadData: () {},
      child: (ListItem data) => ClickableListItemWithIcon(
        onTap: () {
          context.pushNamed(data.id, queryParameters: {
            "studentId": studentId,
          });
        },
        iconUrl: data.iconUrl,
        text: data.text,
      ),
    );
  }
}
