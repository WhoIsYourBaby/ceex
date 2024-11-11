import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_uuid/device_uuid.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoManager {
  DeviceInfoManager._();

  static final DeviceInfoManager _shared = DeviceInfoManager._();

  static DeviceInfoManager get shared => _shared;

  late BaseDeviceInfo _deviceInfo;
  late PackageInfo _packageInfo;
  late String _deviceUuid;

  /// 会在main入口处await一次
  Future<DeviceInfoManager> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    final deviceInfoPlugin = DeviceInfoPlugin();
    _deviceInfo = await deviceInfoPlugin.deviceInfo;
    _deviceUuid = (await DeviceUuid().getUUID()) ?? "unknow";
    return this;
  }

  Size screenSize = const Size(720, 1280);

  String get appName => _packageInfo.appName;

  String get shortVersion => _packageInfo.version;

  /// iOS: bundleIdentifier / android: packageName
  // String get packageName => _packageInfo.packageName;
  String get packageName => "com.bc.broker.ios";

  String get model => _deviceInfo.data["model"] ?? "unknow";

  String get systemName => _deviceInfo.data["systemName"] ?? "unknow";

  String get systemVersion => _deviceInfo.data["systemVersion"] ?? "unknow";

  double devicePixelRatio = 1.0;

  String get deviceUuid => _deviceUuid;
}
