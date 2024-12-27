import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';

class DotPageIndicator extends StatelessWidget {
  const DotPageIndicator(
      {super.key, required this.currentValue, required this.onboardingItems});
  final int currentValue;
  final int onboardingItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            onboardingItems,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    width: index == currentValue ? 36 : 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: CustomColorTheme.colorPrimary,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )),
      ),
    );
  }
}
