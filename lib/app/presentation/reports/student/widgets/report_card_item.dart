import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';

class ReportCardItem extends StatelessWidget {
  ReportCardItem({super.key});

  final _reportCardMenus = [
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Diagnostic Test",
      progress: 20,
      textProgress: "Kurang 80% lagi",
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Introduction to Proof",
      progress: 0,
      textProgress: "Kurang 100% lagi",
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Geometry Proof Format",
      progress: 0,
      textProgress: "Kurang 100% lagi",
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Understanding of Proof Structure",
      progress: 0,
      textProgress: "Kurang 100% lagi",
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Proof Competence Test",
      progress: 0,
      textProgress: "Kurang 100% lagi",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_reportCardMenus[index]),
          ],
        ));
  }
}
