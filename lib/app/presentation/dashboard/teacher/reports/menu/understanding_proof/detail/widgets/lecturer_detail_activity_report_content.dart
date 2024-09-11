import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';

class LecturerDetailActivityReportContent extends StatelessWidget {
  const LecturerDetailActivityReportContent({super.key});

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
          onTap: () {
            // TODO:
          },
          text: "Unduh file jawaban",
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
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Review Jawaban:",
                  style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                      ?.copyWith(color: Colors.grey)),
              // const TextField(
              //   maxLines: 10,
              //   decoration:
              //       InputDecoration(hintText: "Ketik review jawaban"),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
