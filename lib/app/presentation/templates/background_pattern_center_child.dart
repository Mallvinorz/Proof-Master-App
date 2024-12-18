import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';

class BackgroundPatternCenterChild extends StatelessWidget {
  final Widget child;
  final Function onTapBack;
  const BackgroundPatternCenterChild(
      {super.key, required this.child, required this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 52,
        color: CustomColorTheme.colorBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Button(onTap: onTapBack, text: "Kembali"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/img_bg.png'))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  elevation: 20, // Change this
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                  child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFE2E5FF), Color(0xFFFFFFFF)],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 24),
                      child: child),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
