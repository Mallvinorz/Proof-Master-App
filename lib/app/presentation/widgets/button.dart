import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final String text;
  final Widget? suffixIcon;
  final bool onProgress;
  final bool isOutlined;
  final bool isDisabled;
  const Button({
    super.key,
    required this.onTap,
    required this.text,
    this.suffixIcon,
    this.onProgress = false,
    this.isOutlined = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                side: isOutlined
                    ? const BorderSide(width: 1, color: Colors.black)
                    : BorderSide.none,
                borderRadius: const BorderRadius.all(Radius.circular(12)))),
        foregroundColor: WidgetStatePropertyAll<Color>(
          isDisabled
              ? Colors.grey
              : isOutlined
                  ? Colors.white
                  : CustomColorTheme.colorPrimary,
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(
          isDisabled
              ? Colors.grey
              : isOutlined
                  ? Colors.white
                  : CustomColorTheme.colorPrimary,
        ),
      ),
      onPressed: () => onTap(),
      child: onProgress
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisSize: MainAxisSize.min,
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
