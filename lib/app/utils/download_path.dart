import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proofmaster/app/utils/permission.dart';

Future<String?> getAndroidDownloadDirectory() async {
  Fimber.d("permission ${await requestStoragePermission()}");
  if (Platform.isAndroid) {
    // Get the external storage directory
    Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      // Navigate to the Download folder
      String downloadPath = directory.path.split('Android')[0] + 'Download';
      return downloadPath;
    }
  }
  return null;
}
