import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/setting_menu_item.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pengaturan",
                  style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                      ?.copyWith(color: Colors.black),
                ),
              ),
              SettingMenuItem(
                text: "Ubah password",
                onTap: () => context.go('/${ProofmasterRoute.forgotPassword}'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SettingMenuItem(text: "Unduh semua materi", onTap: () {}),
              const SizedBox(
                height: 16.0,
              ),
              SettingMenuItem(
                text: "Keluar",
                textColor: Colors.red,
                color: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
