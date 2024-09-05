import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';

class DetailActivityReportContent extends StatelessWidget {
  const DetailActivityReportContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Material(
          elevation: 8.0,
          shape: const CircleBorder(),
          color: CustomColorTheme.colorBackground2,
          child: Container(
            padding: const EdgeInsets.all(40.0),
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/icons/Paper.png",
              // fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Button(
          onTap: () {},
          text: "Unduh file jawabanmu",
          suffixIcon: const Icon(
            FontAwesomeIcons.solidFilePdf,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Review Jawabanmu:",
                      style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                          ?.copyWith(color: Colors.grey)),
                  Text(
                    "Ini review hasil jawabanmu",
                    style: CustomTextTheme.proofMasterTextTheme.bodyMedium,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
