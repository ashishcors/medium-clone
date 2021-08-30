import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/createaccount/create_account_bindings.dart';
import 'package:medium_clone/app/features/auth/createaccount/mobile_create_account_page.dart';
import 'package:medium_clone/app/features/auth/landing/landing_bindings.dart';
import 'package:medium_clone/app/features/auth/landing/landing_page.dart';
import 'package:medium_clone/app/features/auth/login/login_bindings.dart';
import 'package:medium_clone/app/features/auth/login/mobile_login_page.dart';
import 'package:medium_clone/app/features/auth/loginlanding/login_landing_bindings.dart';
import 'package:medium_clone/app/features/auth/loginlanding/login_landing_page.dart';
import 'package:medium_clone/app/features/auth/splash/splash_bindings.dart';
import 'package:medium_clone/app/features/auth/splash/splash_page.dart';
import 'package:medium_clone/app/features/home/home_bindings.dart';
import 'package:medium_clone/app/features/home/home_page.dart';

part 'app_routes.dart';

/// List all pages in the app with their proper bindings.
class AppPages {
  static const initial = Routes.SPLASH;

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
    GetPage(
      name: Routes.LOGIN,
      page: () => const MobileLoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.LOGIN_LANDING,
      page: () => const LoginLandingPage(),
      binding: LoginLandingBindings(),
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT,
      page: () => const MobileCreateAccountPage(),
      binding: CreateAccountBindings(),
    ),
  ];
}
