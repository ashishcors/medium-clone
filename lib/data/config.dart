import 'package:flutter/foundation.dart';

abstract class Config {
  static const webUrl =
      (kReleaseMode) ? 'https://wizdom-1b521.web.app' : 'http://localhost:52536';
  static const iOSBundleId = 'com.example.ios';
  static const androidPackageName = 'com.wizdom.wizdom';
}
