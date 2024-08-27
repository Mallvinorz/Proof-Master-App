import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/templates/list_item_template.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/widgets/clickable_item_with_icon.dart';

class DiagnosticReportView extends StatelessWidget {
  const DiagnosticReportView({super.key});

  Future<UIState<List<ListItem>>> getDummyData() {
    final dummy = [
      ListItem(
          id: "aaa",
          text: "Learning Modalities Test",
          iconUrl: "assets/icons/learning_ic.png"),
      ListItem(
          id: "aaabb",
          text: "Prior Knowledge Test",
          iconUrl: "assets/icons/prior_ic.png"),
      ListItem(
          id: "aaabbcc",
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
      onLoadData: () {
        //TODO: replace with actual get data function
      },
      child: (ListItem data) => ClickableListItemWithIcon(
        onTap: () {
          //TODO: replace with actual onclick func
        },
        iconUrl: data.iconUrl,
        text: data.text,
      ),
    );
  }
}
