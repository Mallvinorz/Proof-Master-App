import 'package:flutter/material.dart';
import 'package:proofmaster/theme/text_theme.dart';

class TopBannerReport extends StatelessWidget {
  const TopBannerReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 64.0,
        bottom: 32.0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        child: Text(
          "Laporan Aktivitasmu",
          style: CustomTextTheme.proofMasterTextTheme.displayLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
