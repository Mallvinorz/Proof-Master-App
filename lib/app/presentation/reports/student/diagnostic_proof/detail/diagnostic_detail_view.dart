import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/text_theme.dart';

class DiagnosticDetailView extends StatelessWidget {
  final DiagnosticType type;
  final String text;
  const DiagnosticDetailView(
      {super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Learning Modalities Test",
      mainChildren: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    switch (type) {
                      DiagnosticType.VISUAL => "Visual",
                      DiagnosticType.AUDITORY => "Auditori",
                      DiagnosticType.KINESTIC => "Kinestetik",
                    },
                    style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                  ),
                  const SizedBox(height: 24),
                  SvgPicture.asset(switch (type) {
                    DiagnosticType.AUDITORY => 'assets/images/auditory.svg',
                    DiagnosticType.KINESTIC => 'assets/images/kinestestic.svg',
                    DiagnosticType.VISUAL => 'assets/images/visual.svg',
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(text),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DiagnosticType { VISUAL, AUDITORY, KINESTIC }
