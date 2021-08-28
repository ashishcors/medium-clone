import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/splash/splash_bindings.dart';
import 'package:medium_clone/app/features/auth/splash/splash_page.dart';
import 'package:medium_clone/app/features/home/home_bindings.dart';
import 'package:medium_clone/app/features/home/home_page.dart';
import 'package:medium_clone/app/features/landing/landing_bindings.dart';
import 'package:medium_clone/app/features/landing/landing_page.dart';

part 'app_routes.dart';

/// List all pages in the app with their proper bindings.
class AppPages {
  static const initial = Routes.LANDING;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.LANDING,
      page: () => const LandingPage(),
      binding: LandingBindings(),
    ),
  ];
}
