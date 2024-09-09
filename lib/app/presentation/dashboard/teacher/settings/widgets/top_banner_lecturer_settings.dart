import 'package:flutter/material.dart';
import 'package:proofmaster/theme/text_theme.dart';

class TopBannerLecturerSettings extends StatelessWidget {
  const TopBannerLecturerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage("assets/images/dumy_avatar.jpeg"),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Roni",
                  style: CustomTextTheme.proofMasterTextTheme.displayMedium
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  "Roni212@gmail.com",
                  style: CustomTextTheme.proofMasterTextTheme.displaySmall
                      ?.copyWith(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
