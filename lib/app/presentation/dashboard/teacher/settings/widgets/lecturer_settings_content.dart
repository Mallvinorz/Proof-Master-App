import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/setting_menu_item.dart';

class LecturerSettingsContent extends StatelessWidget {
  const LecturerSettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Pengaturan",
                style: CustomTextTheme.proofMasterTextTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SettingMenuItem(
              text: "Ubah Password",
              onTap: () {
                // TODO: add route
              }),
          const SizedBox(
            height: 16,
          ),
          SettingMenuItem(
              text: "Unduh Soal dan Materi",
              onTap: () {
                // TODO: add route
              }),
          const SizedBox(
            height: 16,
          ),
          SettingMenuItem(
              text: "Keluar",
              textColor: CustomColorTheme.colorRedIndicator,
              color: CustomColorTheme.colorRedIndicator,
              onTap: () {
                // TODO: add route
              })
        ],
      ),
    );
  }
}
