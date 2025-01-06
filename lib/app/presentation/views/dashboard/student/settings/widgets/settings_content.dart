import 'dart:core';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proofmaster/app/presentation/common/widget/cupertino_alert_custom_content.dart';
import 'package:proofmaster/app/presentation/providers/auth_provider/auth_provider.dart';
import 'package:proofmaster/app/presentation/providers/user_provider/user_provider.dart';
import 'package:proofmaster/app/presentation/widgets/setting_menu_item.dart';
import 'package:proofmaster/app/utils/download_path.dart';
import 'package:proofmaster/app/utils/permission.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';

class SettingsContent extends ConsumerWidget {
  const SettingsContent({super.key});

  Future<bool> performDownloadAllMaterials() async {
    if (await requestStoragePermission()) {
      String? downloadPath = await getAndroidDownloadDirectory();
      Fimber.d("download path: $downloadPath");

      if (downloadPath == null) return false;
      String? taskId;
      try {
        taskId = await FlutterDownloader.enqueue(
          url:
              'https://pii.or.id/uploads/dummies.pdf', //TODO: replace with actual download materials links
          headers: {}, // optional: header send with url (auth token etc)
          savedDir: downloadPath,
          saveInPublicStorage: true,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
        Fimber.d("download task: $taskId");
      } catch (e) {
        Fimber.d("download task: $e");
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onTap: () => context.push(ProofmasterRoute.forgotPassword),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SettingMenuItem(
                text: "Hapus akun",
                onTap: () => showCupertinoAlertWithCustomContent(
                    context: context,
                    contentText:
                        "Anda tidak bisa lagi masuk ke akun yang telah dihapus.",
                    title: "Apakah anda yakin ingin menghapus akun?",
                    onOk: () async {
                      await ref.read(userProvider.notifier).deleteUserAccount();
                      // ignore: use_build_context_synchronously
                      context.replace(ProofmasterRoute.auth);
                    }),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SettingMenuItem(
                text: "Keluar",
                textColor: Colors.red,
                color: Colors.red,
                onTap: () async {
                  showCupertinoAlertWithCustomContent(
                      context: context,
                      contentText: 'Apakah anda yakin ingin keluar?',
                      title:
                          "Setelah keluar, anda perlu memasukkan email dan password lagi untuk bisa masuk ke akun ini.",
                      onOk: () async {
                        await ref.read(authProvider.notifier).signout();
                        // ignore: use_build_context_synchronously
                        context.pop();
                        // ignore: use_build_context_synchronously
                        context.push(ProofmasterRoute.auth);
                      });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Izin Penyimpanan Diperlukan'),
        content: const Text('Izin penyimpanan diperlukan untuk mengakses file. '
            'Silakan aktifkan di pengaturan aplikasi.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Buka Pengaturan'),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
          ),
        ],
      ),
    );
  }
}
