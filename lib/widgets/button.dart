import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final String text;
  Widget? suffixIcon;
  bool onProgress;
  Button(
      {super.key,
      required this.onTap,
      required this.text,
      this.suffixIcon,
      this.onProgress = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        backgroundColor:
            WidgetStatePropertyAll<Color>(CustomColorTheme.colorPrimary),
      ),
      onPressed: () => onTap(),
      child: onProgress
          ? const Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
                if (suffixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: suffixIcon!,
                  ),
              ],
            ),
    );
  }
}
