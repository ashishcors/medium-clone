import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/home/desktop/desktop_home_controller.dart';
import 'package:medium_clone/app/features/home/desktop/desktop_home_page.dart';
import 'package:medium_clone/app/features/home/mobiletabs/mobile_home_page.dart';
import 'package:medium_clone/app/uikit/widgets/responsive.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      Get.put(DesktopHomeController());
    }

    return Responsive(
      mobile: MobileHomePage(controller: controller),
      desktop: const DesktopHomePage(),
    );
  }
}
