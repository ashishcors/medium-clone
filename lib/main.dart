import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app.dart';
import 'app/app_bindings.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppBindings.init();
  await GetStorage.init();
  setPathUrlStrategy();

  runApp(const App());
}
