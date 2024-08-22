import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final String text;
  Widget? suffixIcon;
  bool onProgress;
  bool isOutlined;
  Button({
    super.key,
    required this.onTap,
    required this.text,
    this.suffixIcon,
    this.onProgress = false,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                side: isOutlined
                    ? const BorderSide(width: 1, color: Colors.black)
                    : BorderSide.none,
                borderRadius: const BorderRadius.all(Radius.circular(12)))),
        foregroundColor: MaterialStatePropertyAll<Color>(
          isOutlined ? Colors.white : CustomColorTheme.colorPrimary,
        ),
        backgroundColor: MaterialStatePropertyAll<Color>(
          isOutlined ? Colors.white : CustomColorTheme.colorPrimary,
        ),
      ),
      onPressed: () => onTap(),
      child: onProgress
          ? Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: isOutlined ? Colors.black : Colors.white,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: isOutlined ? Colors.black : Colors.white),
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
