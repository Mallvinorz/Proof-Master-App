import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class RectangleIndicator extends StatelessWidget {
  final double progress;
  const RectangleIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    Color color;

    if (progress >= 0.0 && progress <= 0.24) {
      color = CustomColorTheme.colorDarkGray;
    } else if (progress >= 0.25 && progress <= 0.49) {
      color = CustomColorTheme.colorRedIndicator;
    } else if (progress >= 0.5 && progress <= 0.74) {
      color = CustomColorTheme.colorOrangeIndicator;
    } else if (progress >= 0.75 && progress <= 0.99) {
      color = CustomColorTheme.colorYellowIndicator;
    } else if (progress == 1.0) {
      color = CustomColorTheme.colorGreenIndicator;
    } else {
      color = Colors.grey;
    }

    return Stack(
      children: [
        Container(
          height: 12,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: CustomColorTheme.colorSoftGray,
          ),
        ),
        LayoutBuilder(builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;
          return Container(
            height: 12,
            width: progress * maxWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color,
            ),
          );
        })
      ],
    );
  }
}
