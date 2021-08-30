import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/createaccount/create_account_bindings.dart';
import 'package:medium_clone/app/features/auth/createaccount/desktop_create_account_page.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/desktop_login_landing_page.dart';
import 'package:medium_clone/app/features/auth/login/desktop_login_page.dart';
import 'package:medium_clone/app/features/auth/login/login_bindings.dart';
import 'package:medium_clone/app/features/base/base_controller.dart';

import 'desktop_create_account_landing_page.dart';

class AuthDialogController extends BaseController {
  final Rx<Widget> currentPage = Rx(const DesktopCreateAccountLandingPage());

  void toLoginLandingPage() {
    currentPage.value = const DesktopLoginLandingPage();
  }

  void toCreateAccountLandingPage() {
    currentPage.value = const DesktopCreateAccountLandingPage();
  }

  void toSignUpWithEmailPage() {
    // provide create account dependencies
    // TODO: check the scope of this dependency
    CreateAccountBindings().dependencies();
    currentPage.value = const DesktopCreateAccountPage();
  }

  void toSignInWithEmailPage() {
    // provide create account dependencies
    // TODO: check the scope of this dependency
    LoginBindings().dependencies();
    currentPage.value = const DesktopLoginPage();
  }
}
