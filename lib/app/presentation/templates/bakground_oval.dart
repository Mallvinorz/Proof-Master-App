import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class BackgroundOval extends StatelessWidget {
  final Widget children;
  const BackgroundOval({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    const bottomBorderRadius = BorderRadius.only(
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20));
    return Scaffold(
      backgroundColor: CustomColorTheme.colorBackground,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: fullHeight / 2,
              decoration: const BoxDecoration(
                borderRadius: bottomBorderRadius,
                color: CustomColorTheme.colorPrimary,
              ),
            ),
          ),
          children
        ],
      ),
    );
  }
}
