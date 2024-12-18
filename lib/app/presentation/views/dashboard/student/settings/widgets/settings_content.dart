import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proofmaster/app/presentation/providers/auth_provider/auth_provider.dart';
import 'package:proofmaster/app/utils/download_path.dart';
import 'package:proofmaster/app/utils/permission.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/setting_menu_item.dart';

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
              const SizedBox(
                height: 16.0,
              ),
              SettingMenuItem(
                text: "Keluar",
                textColor: Colors.red,
                color: Colors.red,
                onTap: () async {
                  await showAlert(context, ref);
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

  Future<bool?> showAlert(BuildContext context, WidgetRef ref) async {
    return await alertDialog(
      isSuccess: false,
      title: 'Apakah anda yakin ingin keluar?',
      message:
          "Setelah keluar, anda perlu memasukkan email dan password lagi untuk bisa masuk ke akun ini.",
      actionWidgets: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Tidak'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text(
            'Ya, saya yakin',
            style: TextStyle(color: CustomColorTheme.colorRedIndicator),
          ),
          onPressed: () async {
            await ref.read(authProvider.notifier).signout();
            // ignore: use_build_context_synchronously
            context.push(ProofmasterRoute.auth);
            // ignore: use_build_context_synchronously
            context.pop();
          },
        ),
      ],
      context: context,
    );
  }
}
