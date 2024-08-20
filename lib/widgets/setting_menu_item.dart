import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/text_theme.dart';

class SettingMenuItem extends StatelessWidget {
  final String text;
  final Function() onTap;
  const SettingMenuItem({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: CustomTextTheme.proofMasterTextTheme.bodyLarge),
              const Icon(FontAwesomeIcons.chevronRight)
            ],
          ),
        ),
      ),
    );
  }
}
