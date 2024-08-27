import 'package:flutter/material.dart';
import 'package:proofmaster/theme/text_theme.dart';

class TopBannerSettings extends StatelessWidget {
  const TopBannerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 56.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 28.0,
              backgroundImage: AssetImage("assets/images/dumy_avatar.jpeg"),
            ),
            const SizedBox(
              width: 16.0,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
