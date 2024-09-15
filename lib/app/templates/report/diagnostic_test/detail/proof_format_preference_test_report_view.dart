import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/results/proof_format_preference_result_view.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ProofFormatPreferenceTestReportView extends StatelessWidget {
  final String? studentId;
  const ProofFormatPreferenceTestReportView({super.key, this.studentId});

  @override
  Widget build(BuildContext context) {
    const type = ProofFormatPreferenceType.FLOW_CHART;
    return BackgroundPattern(
      appBarTitle: "Proof Format Preference Report",
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
                      ProofFormatPreferenceType.PARAGRAPH =>
                        "Preferensi Paragraf Bukti",
                      ProofFormatPreferenceType.TWO_COLUMN =>
                        "Preferensi Dua-Kolom Bukti",
                      ProofFormatPreferenceType.FLOW_CHART =>
                        "Preferensi Flow-Chart Bukti",
                    },
                    style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                  ),
                  _newMargin(),
                  SvgPicture.asset('assets/images/Celebration.svg'),
                  _newMargin(),
                  Text(
                    switch (type) {
                      ProofFormatPreferenceType.PARAGRAPH =>
                        "Kamu memiliki pemahaman yang baik dalam preferensi paragraf bukti. Kamu lebih suka bukti yang disajikan dalam bentuk paragraf berurutan yang menjelaskan logika bukti secara naratif.",
                      ProofFormatPreferenceType.TWO_COLUMN =>
                        "Kamu memiliki pemahaman yang baik dalam preferensi dua-kolom bukti. Kamu lebih suka bukti yang disajikan dalam dua kolom terpisah, satu kolom untuk pernyataan dan satu kolom untuk alasan.",
                      ProofFormatPreferenceType.FLOW_CHART =>
                        "Kamu memiliki pemahaman yang baik dalam preferensi flow-chart bukti. Kamu lebih suka bukti yang disajikan dalam bentuk diagram alir yang menunjukkan langkah-langkah bukti secara visual dan terstruktur.",
                    },
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
