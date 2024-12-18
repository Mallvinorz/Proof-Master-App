import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    // For Android 10 and above (API level 29+)
    if (sdkInt >= 29) {
      // Scoped storage is enforced, no need for runtime permission
      return true;
    }
    // For Android 9 and below
    else {
      final permissionStatus = await Permission.storage.status;
      if (permissionStatus.isGranted) {
        return true;
      } else {
        final result = await Permission.storage.request();
        return result.isGranted;
      }
    }
  }
  return false;
}
