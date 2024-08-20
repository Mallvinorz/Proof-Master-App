import 'package:flutter/material.dart';
import 'package:proofmaster/theme/text_theme.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0, top: 62.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Halo, Roni",
                  style: CustomTextTheme.proofMasterTextTheme.displayLarge
                      ?.copyWith(color: Colors.white),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dumy_avatar.jpeg'),
                )
              ],
            ),
            Text(
              "Yuk selesaikan progresmu!",
              style: CustomTextTheme.proofMasterTextTheme.displaySmall
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
