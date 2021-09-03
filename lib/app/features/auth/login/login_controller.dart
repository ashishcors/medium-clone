import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/base/base_controller.dart';
import 'package:medium_clone/app/features/base/view_state.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/data/dynamic_link_helper.dart';

class LoginController extends BaseController {
  final SendLoginMagicLinkUseCase _sendLoginMagicLinkUseCase;
  final VerifyLoginMagicLinkUseCase _verifyLoginMagicLinkUseCase;
  final DeeplinkHelper _deeplinkHelper;

  LoginController(this._sendLoginMagicLinkUseCase, this._deeplinkHelper,
      this._verifyLoginMagicLinkUseCase);

  @override
  bool isAuthenticationRequired() => false;

  final emailController = TextEditingController();

  final loginState = ViewState<String>.idle().obs;

  @override
  void onInit() {
    super.onInit();

    // Check for login deeplink, for web.
    final path = Uri.base.toString();
    // TODO: find better way to do this
    if (path.contains("apiKey")) {
      _verifyLoginDeeplink(path);
    }
  }

  void submitData() async {
    final email = emailController.text;
    if (email.isEmpty || !email.isEmail) {
      loginState.value = ViewState.error("Please enter a valid email");
      return;
    }
    loginState.value = ViewState.loading();
    final result =
        await _sendLoginMagicLinkUseCase.call(SendLoginMagicLinkParams(email));

    result.when(
      success: (value) {
        loginState.value = ViewState.success(email);
        _deeplinkHelper.addDynamicLinkListener(
          (deeplink) => _verifyLoginDeeplink(deeplink.path),
        );
      },
      error: (exception) {
        loginState.value = ViewState.error(null);
      },
    );
  }

  void _verifyLoginDeeplink(String path) async {
    loginState.value = ViewState.loading();
    final result = await _verifyLoginMagicLinkUseCase.call(path);

    result.when(
      success: (data) {
        Navik.toHome(clearCurrent: true);
      },
      error: (exception) {
        Navik.toLanding(clearCurrent: true);
      },
    );
  }
}
