import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/theme/color_theme.dart';

// ignore: must_be_immutable
class BackgroundPattern extends StatelessWidget {
  final Widget mainChildren;
  final String? appBarTitle;
  final Widget? topChildren;
  final Widget? bottomBar;
  BorderRadius? borderRadius;
  bool usePatternBg;
  BackgroundPattern(
      {super.key,
      required this.mainChildren,
      this.appBarTitle,
      this.usePatternBg = true,
      this.borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(29), topRight: Radius.circular(29)),
      this.bottomBar,
      this.topChildren});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle != null
          ? AppBar(
              backgroundColor: CustomColorTheme.colorPrimary,
              leading: IconButton(
                icon: const Icon(FontAwesomeIcons.chevronLeft,
                    color: Colors.white),
                onPressed: () => context.pop(),
              ),
              title: Text(
                maxLines: 2,
                appBarTitle!,
                style: const TextStyle(color: Colors.white),
              ),
            )
          : null,
      backgroundColor: CustomColorTheme.colorPrimary,
      body: Stack(
        children: [
          // const Image(image: AssetImage('assets/images/img_bg.png')),
          Column(
            children: [
              if (topChildren != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: topChildren,
                ),
              const SizedBox(height: 18),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      image: usePatternBg
                          ? const DecorationImage(
                              image: AssetImage('assets/images/img_bg.png'))
                          : null,
                      borderRadius: borderRadius,
                      color: CustomColorTheme.colorBackground),
                  child: mainChildren,
                ),
              )
            ],
          ),
          if (bottomBar != null)
            Align(alignment: Alignment.bottomCenter, child: bottomBar!)
        ],
      ),
    );
  }
}
