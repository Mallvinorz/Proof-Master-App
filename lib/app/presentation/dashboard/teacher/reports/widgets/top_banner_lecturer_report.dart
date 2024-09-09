import 'package:flutter/material.dart';
import 'package:proofmaster/theme/text_theme.dart';

class TopBannerLecturerReport extends StatelessWidget {
  const TopBannerLecturerReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Anthonny",
            style: CustomTextTheme.proofMasterTextTheme.displayMedium
                ?.copyWith(color: Colors.white),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
