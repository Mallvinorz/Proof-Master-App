import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';

class PriorKnowledgeResultView extends StatelessWidget {
  final PriorKnowledgeType type;
  final String text;
  const PriorKnowledgeResultView({
    super.key,
    required this.type,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: CustomColorTheme.colorBackground2,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(125, 0, 0, 0),
                                blurRadius: 28,
                                offset: Offset(0, 4))
                          ]),
                      child: Column(
                        children: [
                          Text(
                            "Hasil Prior Knowledge Test",
                            style: CustomTextTheme
                                .proofMasterTextTheme.displayMedium
                                ?.copyWith(
                                    color: CustomColorTheme.colorPrimary),
                            textAlign: TextAlign.center,
                          ),
                          _newMargin(),
                          SvgPicture.asset(switch (type) {
                            // TODO: Handle this case.
                            PriorKnowledgeType.ONE =>
                              'assets/icons/one_star_ic.svg',
                            // TODO: Handle this case.
                            PriorKnowledgeType.TWO =>
                              'assets/icons/two_stars_ic.svg',
                            // TODO: Handle this case.
                            PriorKnowledgeType.THREE =>
                              'assets/icons/three_stars_ic.svg',
                            // TODO: Handle this case.
                            PriorKnowledgeType.FOUR =>
                              'assets/icons/four_stars_ic.svg',
                            // TODO: Handle this case.
                            PriorKnowledgeType.FIVE =>
                              'assets/icons/five_stars_ic.svg',
                            // TODO: Handle this case.
                            PriorKnowledgeType.SIX =>
                              'assets/icons/six_stars_ic.svg',
                          }),
                          _newMargin(),
                          Text(
                            switch (type) {
                              // TODO: Handle this case.
                              PriorKnowledgeType.ONE => "Unsupported Response",
                              // TODO: Handle this case.
                              PriorKnowledgeType.TWO => "Surface",
                              // TODO: Handle this case.
                              PriorKnowledgeType.THREE => "Beyond Surface",
                              // TODO: Handle this case.
                              PriorKnowledgeType.FOUR => "Skipping Recognizing",
                              // TODO: Handle this case.
                              PriorKnowledgeType.FIVE =>
                                "Beyond Recognizing Element",
                              // TODO: Handle this case.
                              PriorKnowledgeType.SIX =>
                                "Beyond Chaining Element",
                            },
                            style: CustomTextTheme
                                .proofMasterTextTheme.displayMedium,
                          ),
                          _newMargin(),
                          Text(
                            text,
                            style:
                                CustomTextTheme.proofMasterTextTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Button(
                    onTap: () {
                      // TODO: add route
                    },
                    text: "Kembali")
              ],
            ),
          )
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

enum PriorKnowledgeType { ONE, TWO, THREE, FOUR, FIVE, SIX }
