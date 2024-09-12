import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ProofFormatPreferenceTestReportView extends StatelessWidget {
  final ProofFormatPreferenceReportType type;
  final String text;
  const ProofFormatPreferenceTestReportView({
    super.key,
    required this.type,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Proof Format Preference Test",
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
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: CustomColorTheme.colorBackground2,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(125, 0, 0, 0),
                    blurRadius: 28,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    switch (type) {
                      // TODO: Handle this case.
                      ProofFormatPreferenceReportType.PARAGRAPH =>
                        "Preferensi Paragraf Bukti",
                      // TODO: Handle this case.
                      ProofFormatPreferenceReportType.TWO_COLUMN =>
                        "Preferensi Dua-Kolom Bukti",
                      // TODO: Handle this case.
                      ProofFormatPreferenceReportType.FLOW_CHART =>
                        "Preferensi Flow-Chart Bukti",
                    },
                    style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                  ),
                  _newMargin(),
                  SvgPicture.asset('assets/images/Celebration.svg'),
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

enum ProofFormatPreferenceReportType { PARAGRAPH, TWO_COLUMN, FLOW_CHART }
