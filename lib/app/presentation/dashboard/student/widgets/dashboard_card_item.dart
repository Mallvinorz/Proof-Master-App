import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/text_theme.dart';

import '../../../../domain/entities/material/learning_material.dart';

class DashboardCardItem extends StatelessWidget {
  final LearningMaterial learningMaterial;
  const DashboardCardItem({super.key, required this.learningMaterial});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  width: 96,
                  height: 96,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Icon(FontAwesomeIcons.accusoft)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          learningMaterial.name,
                          style: CustomTextTheme.proofMasterTextTheme.bodyLarge,
                        ),
                        Text(
                          learningMaterial.desc,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Add some space
              ],
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Text(
                    "${learningMaterial.finishedSubLearningMaterial}/${learningMaterial.totalSubLearningMaterial}"))
          ],
        ),
      ),
    );
  }
}