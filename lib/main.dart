import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'app/app.dart';
import 'app/app_bindings.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await AppBindings.init();

  runApp(const App());
}
