import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: AppLogo()),
    );
  }
}
