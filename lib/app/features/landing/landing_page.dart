import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/landing/mobile_landing_page.dart';
import 'package:medium_clone/app/uikit/widgets/responsive.dart';

import 'desktop_landing_page.dart';
import 'landing_controller.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileLandingPage(),
      desktop: DesktopLandingPage(),
    );
  }
}
