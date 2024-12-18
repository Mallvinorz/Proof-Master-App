import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onTap;
  // final Function condition;
  final String text;
  const CustomOutlinedButton(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side:
            const BorderSide(color: CustomColorTheme.colorPrimary, width: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () => onTap(),
      child: Text(
        text,
        style: const TextStyle(
          color: CustomColorTheme.colorPrimary,
        ),
      ),
    );
  }
}
