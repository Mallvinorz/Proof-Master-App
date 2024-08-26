import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class IntroductionProofItem extends StatelessWidget {
  final String text;
  final bool finished;
  final int finishedCount;
  final int totalCount;
  const IntroductionProofItem(
      {super.key,
      required this.text,
      required this.finished,
      required this.finishedCount,
      required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: finished ? CustomColorTheme.colorGreen : null,
              shape: BoxShape.circle),
          child: Icon(
            finished ? FontAwesomeIcons.check : FontAwesomeIcons.hourglassEnd,
            color: finished ? CustomColorTheme.colorBackground : Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            text,
            style: CustomTextTheme.proofMasterTextTheme.bodyLarge,
          ),
        ),
        const Spacer(flex: 1),
        Text("$finishedCount/$totalCount")
      ],
    );
  }
}
