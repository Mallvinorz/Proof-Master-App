import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';

class LearningModalititesResultView extends StatelessWidget {
  final LearningModalitiesType type;
  final String text;
  const LearningModalititesResultView({
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
                            "Hasil Learning Modalities Test",
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
                              LearningModalitiesType.VISUAL => "Visual",
                              // TODO: Handle this case.
                              LearningModalitiesType.AUDITORY => "Auditori",
                              // TODO: Handle this case.
                              LearningModalitiesType.KINESTETIC => "Kinestetik",
                            },
                            style: CustomTextTheme
                                .proofMasterTextTheme.displayMedium,
                          ),
                          _newMargin(),
                          SvgPicture.asset('assets/images/visual.svg'),
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

enum LearningModalitiesType { VISUAL, AUDITORY, KINESTETIC }
