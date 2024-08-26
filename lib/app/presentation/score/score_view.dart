import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/app/templates/background_pattern_center_child.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternCenterChild(
        child: _buildCardContent(), onTapBack: () {});
  }

  Widget _buildCardContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Selamat",
          style: CustomTextTheme.proofMasterTextTheme.displayMedium,
        ),
        SvgPicture.asset(
          'assets/images/success.svg',
          width: 240,
          height: 240,
        ),
        Text(
          "Nilai tesmu",
          style: CustomTextTheme.proofMasterTextTheme.displayMedium,
        ),
        const Text(
          "100",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 32),
        ),
      ],
    );
  }
}
