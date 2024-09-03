import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/report_item/report_item.dart';
import 'package:proofmaster/app/presentation/reports/student/widgets/rectangle_indicator.dart';
import 'package:proofmaster/app/presentation/reports/student/widgets/text_indicator.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ReportContent extends StatelessWidget {
  ReportContent({super.key});

  final _reportCardMenus = [
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Diagnostic Test",
      progress: 0.2,
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Introduction to Proof",
      progress: 0,
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Geometry Proof Format",
      progress: 0,
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Understanding of Proof Structure",
      progress: 0,
    ),
    ReportItem(
      route: "", //TODO: replace with actual route
      textTitle: "Proof Competence Test",
      progress: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: _reportCardMenus.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                // TODO: Implement on click to route navigation
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _reportCardMenus[index].textTitle,
                        style: CustomTextTheme.proofMasterTextTheme.bodyLarge,
                      ),
                    ],
                  ),
                  RectangleIndicator(
                      progress: _reportCardMenus[index].progress),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextIndicator(progress: _reportCardMenus[index].progress)
                    ],
                  ),
                ],
              ),
            ));
  }
}
