import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';

class ProofFormatPreferenceResultView extends StatelessWidget {
  final ProofFormatPreferenceType type;
  const ProofFormatPreferenceResultView({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorTheme.colorBackground,
      body: Stack(
        children: [
          Center(child: Image.asset('assets/images/img_bg.png')),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13),
                          bottomLeft: Radius.circular(13),
                        ),
                        color: CustomColorTheme.colorBackground2,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(128, 0, 0, 0),
                              blurRadius: 28,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Hasil Proof Format Preference Test",
                            style: CustomTextTheme
                                .proofMasterTextTheme.displayMedium
                                ?.copyWith(
                                    color: CustomColorTheme.colorPrimary),
                            textAlign: TextAlign.center,
                          ),
                          _newMargin(),
                          Text(
                            switch (type) {
                              // TODO: Handle this case.
                              ProofFormatPreferenceType.PARAGRAPH =>
                                "Preferensi Paragraf Bukti",
                              // TODO: Handle this case.
                              ProofFormatPreferenceType.TWO_COLUMN =>
                                "Preferensi Dua-Kolom Bukti",
                              // TODO: Handle this case.
                              ProofFormatPreferenceType.FLOW_CHART =>
                                "Preferensi Flow_Chart Bukti",
                            },
                            style: CustomTextTheme
                                .proofMasterTextTheme.displayMedium,
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
                            style:
                                CustomTextTheme.proofMasterTextTheme.bodyMedium,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                      onTap: () {
                        context.go(ProofmasterRoute.home);
                      },
                      text: "Kembali"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _newMargin() {
    return const SizedBox(
      height: 20,
    );
  }
}

enum ProofFormatPreferenceType { PARAGRAPH, TWO_COLUMN, FLOW_CHART }
