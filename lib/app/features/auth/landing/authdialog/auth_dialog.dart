import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/auth_dialog_controller.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/app/uikit/uikit.dart';

enum AuthDialogEntryPoint {
  getStarted,
  signIn,
  startWriting,
  bookmarkArticle,
}

class AuthDialog extends GetView<AuthDialogController> {
  // TODO: for some reason we are unable to pass argument to dialog, hence using this. Fix this
  final AuthDialogEntryPoint entryPoint;

  const AuthDialog(this.entryPoint, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.setInitialPage(entryPoint);
    return AuthDialogContainer(
      child: Obx(
        () => controller.currentPage.value,
      ),
    );
  }
}

class AuthDialogContainer extends StatelessWidget {
  final Widget child;

  const AuthDialogContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: ColorPalette.background.withAlpha(225),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: Get.width / 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorPalette.background,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 8, spreadRadius: -4),
            ],
          ),
          child: Stack(children: [
            child,
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: ColorPalette.primary.withAlpha(120),
                  ),
                  onPressed: Navik.back,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
