import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

import '../../../../../../domain/entities/material/learning_material.dart';

class DashboardCardItem extends StatelessWidget {
  final MenuItem dashboardItem;
  final LearningMaterial learningMaterial;
  const DashboardCardItem(
      {super.key, required this.dashboardItem, required this.learningMaterial});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        color: CustomColorTheme.colorBackground2,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    width: 96,
                    height: 96,
                    child: Align(
                      alignment: Alignment.center,
                      child: dashboardItem.iconUrl != null
                          ? Image.network(
                              dashboardItem.iconUrl!,
                              width: 48,
                              height: 48,
                            )
                          : const Icon(FontAwesomeIcons.accusoft),
                    ),
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
                            style:
                                CustomTextTheme.proofMasterTextTheme.bodyLarge,
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
            ),
            if (learningMaterial.isLocked)
              Positioned.fill(
                child: Container(
                  color:
                      Colors.black.withOpacity(0.5), // Adjust opacity as needed
                ),
              ),
            Positioned(
                right: 8,
                bottom: 8,
                child: learningMaterial.isLocked
                    ? const Icon(
                        FontAwesomeIcons.lock,
                        color: Colors.white,
                      )
                    : Text(
                        "${learningMaterial.finishedSubLearningMaterial}/${learningMaterial.totalSubLearningMaterial}")),
          ],
        ),
      ),
    );
  }
}
