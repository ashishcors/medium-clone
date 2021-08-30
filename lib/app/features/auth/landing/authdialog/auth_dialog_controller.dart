import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/createaccount/create_account_bindings.dart';
import 'package:medium_clone/app/features/auth/createaccount/desktop_create_account_page.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/auth_dialog.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/desktop_login_landing_page.dart';
import 'package:medium_clone/app/features/auth/login/desktop_login_page.dart';
import 'package:medium_clone/app/features/auth/login/login_bindings.dart';
import 'package:medium_clone/app/features/base/base_controller.dart';

import 'desktop_create_account_landing_page.dart';

class AuthDialogController extends BaseController {
  final Rx<Widget> currentPage = Rx(const DesktopCreateAccountLandingPage());

  @override
  void onInit() {
    super.onInit();
    // TODO: this is not working, fix this
    // final entryPoint = Get.arguments as int;
    // setInitialPage(AuthDialogEntryPoint.values[entryPoint]);
  }

  void setInitialPage(AuthDialogEntryPoint entryPoint) {
    if (entryPoint == AuthDialogEntryPoint.getStarted) {
      toCreateAccountLandingPage();
    } else if (entryPoint == AuthDialogEntryPoint.signIn) {
      toLoginLandingPage();
    } else if (entryPoint == AuthDialogEntryPoint.startWriting) {
      toCreateAccountLandingPage(
        customTitle: "To start writing, join Wizdom. It's fast and free.",
      );
    } else if (entryPoint == AuthDialogEntryPoint.bookmarkArticle) {
      toCreateAccountLandingPage(
          customTitle: "Create an account to bookmark this story.",
          customSubtitle:
              "Save stories to your personalized\nbookmarks and access them anytime,\nanywhere.");
    } else {
      Get.snackbar("An error occurred.", "unknown AuthDialogEntryPoint");
    }
  }

  void toCreateAccountLandingPage({
    String? customTitle,
    String? customSubtitle,
  }) {
    currentPage.value = DesktopCreateAccountLandingPage(
      customTitle: customTitle,
      customSubtitle: customSubtitle,
    );
  }

  void toLoginLandingPage() {
    currentPage.value = const DesktopLoginLandingPage();
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
