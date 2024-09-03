import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class RectangleIndicator extends StatelessWidget {
  final double progress;
  const RectangleIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    Color color;

    if (progress >= 0 && progress <= 0.24) {
      color = Colors.grey;
    }
    if (progress >= 0.25 && progress <= 0.49) {
      color = CustomColorTheme.colorRedIndicator;
    }
    if (progress >= 0.5 && progress <= 0.74) {
      color = CustomColorTheme.colorOrangeIndicator;
    }
    if (progress >= 0.75 && progress <= 0.99) {
      color = CustomColorTheme.colorYellowIndicator;
    }
    if (progress == 1) {
      color = CustomColorTheme.colorGreenIndicator;
    } else {
      color = CustomColorTheme.colorSoftGray;
    }

    return Stack(
      children: [
        Container(
          color: CustomColorTheme.colorSoftGray,
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Container(
          color: color,
          height: 8,
          width: double.infinity * progress,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ],
    );
  }
}
