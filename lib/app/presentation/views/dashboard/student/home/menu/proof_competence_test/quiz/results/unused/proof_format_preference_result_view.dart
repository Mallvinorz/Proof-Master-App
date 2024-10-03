import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';

class ProofFormatPreferenceResultView extends StatelessWidget {
  final ProofFormatPreferenceType type;
  final String text;
  const ProofFormatPreferenceResultView({
    super.key,
    required this.type,
    required this.text,
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
                            text,
                            style:
                                CustomTextTheme.proofMasterTextTheme.bodyMedium,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Button(
                  onTap: () {
                    // TODO: add route
                  },
                  text: "Kembali",
                ),
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
