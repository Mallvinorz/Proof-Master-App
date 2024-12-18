import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ClickableListItemWithIcon extends StatelessWidget {
  final String iconUrl;
  final String text;
  final Function onTap;
  final String? desc;

  const ClickableListItemWithIcon(
      {super.key,
      required this.onTap,
      required this.iconUrl,
      required this.text,
      this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: CustomColorTheme.colorBackground2,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              _buildIcon(iconUrl, 52),
              const SizedBox(width: 16),
              Column(
                children: [
                  Text(
                    text,
                    style: CustomTextTheme.proofMasterTextTheme.bodyLarge,
                  ),
                  if (desc != null) Text(desc!)
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String iconUrl, double size) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image.asset(
        iconUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
