import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class TextIndicator extends StatelessWidget {
  final double progress;
  const TextIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    String text = '';
    var value = progress * 100;
    var prog = value.toInt();

    if (prog == 0) {
      text = "Belum dikerjakan";
    } else if (prog > 0 && prog <= 99) {
      text = "Kurang ${100 - prog}% lagi";
    } else if (prog == 100) {
      text = "Selesai 100%";
    } else {
      "";
    }

    return Text(
      text,
      style: const TextStyle(color: CustomColorTheme.colorDarkGray),
    );
  }
}
