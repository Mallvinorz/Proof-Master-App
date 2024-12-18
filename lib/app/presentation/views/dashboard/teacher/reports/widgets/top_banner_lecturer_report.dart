import 'package:flutter/material.dart';
import 'package:proofmaster/theme/text_theme.dart';

class TopBannerLecturerReport extends StatelessWidget {
  final String? studentName;
  const TopBannerLecturerReport({super.key, required this.studentName});

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
            studentName ?? "-",
            style: CustomTextTheme.proofMasterTextTheme.displayMedium
                ?.copyWith(color: Colors.white),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
