import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/templates/list_item_template.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/widgets/clickable_item_with_icon.dart';

class UnderstandngProofReportView extends StatelessWidget {
  final String? studentId;
  const UnderstandngProofReportView({super.key, required this.studentId});

  Future<UIState<List<ListItem>>> getDummyData() async {
    final dummy = [
      ListItem(
          id: "aaa", text: "Aktivitas 1", iconUrl: "assets/icons/todo_ic.png"),
      ListItem(
          id: "aaabb",
          text: "Aktivitas 2",
          iconUrl: "assets/icons/todo_ic.png"),
      ListItem(
          id: "aaabbcc",
          text: "Aktivitas 3",
          iconUrl: "assets/icons/todo_ic.png"),
      ListItem(
          id: "aaabbcc",
          text: "Aktivitas 4",
          iconUrl: "assets/icons/todo_ic.png"),
      ListItem(
          id: "aaabbcc",
          text: "Aktivitas 5",
          iconUrl: "assets/icons/todo_ic.png"),
      ListItem(
          id: "aaabbcc",
          text: "Aktivitas 6",
          iconUrl: "assets/icons/todo_ic.png"),
      ListItem(
          id: "aaabbcc",
          text: "Aktivitas 7",
          iconUrl: "assets/icons/todo_ic.png"),
      ListItem(
          id: "aaabbcc",
          text: "Aktivitas 8",
          iconUrl: "assets/icons/todo_ic.png"),
    ];
    return Future.value(UISuccess(dummy));
  }

  @override
  Widget build(BuildContext context) {
    return ListItemTemplate<ListItem>(
      title: "Understanding to Proof Structure Report",
      futureData: getDummyData(),
      onLoadData: () {},
      child: (ListItem data) => ClickableListItemWithIcon(
        onTap: () => context.pushNamed(
            ProofmasterRoute.understandingProofReportDetail,
            queryParameters: {"studentId": studentId, "title": data.text}),
        iconUrl: data.iconUrl,
        text: data.text,
      ),
    );
  }
}
