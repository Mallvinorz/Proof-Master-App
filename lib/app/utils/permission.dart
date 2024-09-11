import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    final permissionStatus = sdkInt >= 33
        ? await Permission.manageExternalStorage.isGranted
        : await Permission.storage.isGranted;

    if (permissionStatus) {
      return true;
    } else {
      PermissionStatus result = sdkInt >= 33
          ? await Permission.manageExternalStorage.request()
          : await Permission.storage.request();
      return result.isGranted;
    }
  }
  return false;
}
