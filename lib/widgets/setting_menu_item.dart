import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/text_theme.dart';

class SettingMenuItem extends StatelessWidget {
  final String text;
  final Color textColor;
  final MaterialColor color;
  final Function() onTap;
  const SettingMenuItem(
      {super.key,
      required this.text,
      required this.onTap,
      this.textColor = Colors.black,
      this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                      ?.copyWith(color: textColor)),
              Icon(
                FontAwesomeIcons.chevronRight,
                color: color,
                size: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
