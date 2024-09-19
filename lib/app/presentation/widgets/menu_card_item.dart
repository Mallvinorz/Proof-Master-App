import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class MenuCardItem extends StatelessWidget {
  final MenuItem menuItem;
  const MenuCardItem({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        color: CustomColorTheme.colorBackground2,
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
                  child: Align(
                    alignment: Alignment.center,
                    child: menuItem.iconUrl != null
                        ? Image.network(
                            menuItem.iconUrl!,
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
                          menuItem.menuText ?? "-",
                          style: CustomTextTheme.proofMasterTextTheme.bodyLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          menuItem.menuDesc ?? "-",
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Add some space
              ],
            ),
          ],
        ),
      ),
    );
  }
}
