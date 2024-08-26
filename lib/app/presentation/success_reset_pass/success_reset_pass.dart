import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/app/templates/background_pattern_center_child.dart';
import 'package:proofmaster/theme/text_theme.dart';

class SuccessResetPass extends StatelessWidget {
  const SuccessResetPass({super.key});

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
          textAlign: TextAlign.center,
          "Email reset password telah dikirim!",
          style: CustomTextTheme.proofMasterTextTheme.displayMedium,
        ),
        SvgPicture.asset(
          'assets/images/success_reset_pass.svg',
          width: 240,
          height: 240,
        ),
        const Text(
          textAlign: TextAlign.center,
          "Silahkan cek inbox emailmu",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
        ),
      ],
    );
  }
}
