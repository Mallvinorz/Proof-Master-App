import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class PriorKnowledgeTestReportView extends StatelessWidget {
  final PriorKnowledgeReportType type;
  final String text;
  const PriorKnowledgeTestReportView({
    super.key,
    required this.type,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Prior Knowledge Test",
      onTapNavBack: () {
        // TODO: add route
      },
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
      mainChildren: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: const BoxDecoration(
                  color: CustomColorTheme.colorBackground2,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(125, 0, 0, 0),
                      blurRadius: 28,
                      offset: Offset(0, 4),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      bottomLeft: Radius.circular(13))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(switch (type) {
                    // TODO: Handle this case.
                    PriorKnowledgeReportType.ONE =>
                      'assets/icons/one_star_ic.svg',
                    // TODO: Handle this case.
                    PriorKnowledgeReportType.TWO =>
                      'assets/icons/two_stars_ic.svg',
                    // TODO: Handle this case.
                    PriorKnowledgeReportType.THREE =>
                      'assets/icons/three_stars_ic.svg',
                    // TODO: Handle this case.
                    PriorKnowledgeReportType.FOUR =>
                      'assets/icons/four_stars_ic.svg',
                    // TODO: Handle this case.
                    PriorKnowledgeReportType.FIVE =>
                      'assets/icons/five_stars_ic.svg',
                    // TODO: Handle this case.
                    PriorKnowledgeReportType.SIX =>
                      'assets/icons/six_stars_ic.svg',
                  }),
                  _newMargin(),
                  Text(
                    switch (type) {
                      // TODO: Handle this case.
                      PriorKnowledgeReportType.ONE => "Unsupported Response",
                      // TODO: Handle this case.
                      PriorKnowledgeReportType.TWO => "Surface",
                      // TODO: Handle this case.
                      PriorKnowledgeReportType.THREE => "Beyond Surface",
                      // TODO: Handle this case.
                      PriorKnowledgeReportType.FOUR => "Skipping Recognizing",
                      // TODO: Handle this case.
                      PriorKnowledgeReportType.FIVE =>
                        "Beyond Recognizing Element",
                      // TODO: Handle this case.
                      PriorKnowledgeReportType.SIX => "Beyond Chaining Element",
                    },
                    style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                  ),
                  _newMargin(),
                  Text(
                    text,
                    style: CustomTextTheme.proofMasterTextTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _newMargin() {
    return const SizedBox(
      height: 20,
    );
  }
}

enum PriorKnowledgeReportType { ONE, TWO, THREE, FOUR, FIVE, SIX }
