import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/theme/text_theme.dart';

class GeometryProofReportView extends StatelessWidget {
  const GeometryProofReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
        appBarTitle: "Geometry Proof Format",
        borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
        mainChildren: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Text(
              "Content not found!",
              style: CustomTextTheme.proofMasterTextTheme.bodyLarge,
            ),
          ),
        ));
  }
}
