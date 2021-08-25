import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routing/app_pages.dart';
import 'uikit/uikit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = GetMaterialApp(
        title: "Wizdom",
        theme: AppTheme.dark,
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
        translations: Str(),
        locale: const Locale('hi', 'IN'),
        fallbackLocale: const Locale('en', 'US'));
    return app;
  }
}
