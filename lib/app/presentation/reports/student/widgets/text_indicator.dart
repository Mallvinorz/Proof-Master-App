import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class TextIndicator extends StatelessWidget {
  final double progress;
  const TextIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    String text = "";

    if (progress == 0) {
      text = "Belum dikerjakan";
    }
    if (progress > 0 && progress <= 99) {
      text = "Kurang ${100 - (progress * 100)}% lagi";
    } else {
      text = "Selesai 100%";
    }

    return Text(
      text,
      style: const TextStyle(color: CustomColorTheme.colorDarkGray),
    );
  }
}
