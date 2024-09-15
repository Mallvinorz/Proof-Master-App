import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern_center_child.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ResultView extends StatelessWidget {
  final double score;
  const ResultView({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternCenterChild(
        child: _buildCardContent(),
        onTapBack: () {
          context.go(ProofmasterRoute.home);
        });
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
        Text(
          "$score",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 32),
        ),
      ],
    );
  }
}
