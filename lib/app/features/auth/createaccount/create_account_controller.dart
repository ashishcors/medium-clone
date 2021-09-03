import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/base/base_controller.dart';
import 'package:medium_clone/app/features/base/view_state.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/data/dynamic_link_helper.dart';

class CreateAccountController extends BaseController {
  final SendSignUpMagicLinkUseCase _sendSignUpMagicLinkUseCase;
  final CompleteSignUpWithMagicLinkUseCase _createAccountWithMagicLinkUseCase;
  final DeeplinkHelper _deeplinkHelper;

  CreateAccountController(
    this._sendSignUpMagicLinkUseCase,
    this._createAccountWithMagicLinkUseCase,
    this._deeplinkHelper,
  );

  @override
  bool isAuthenticationRequired() => false;

  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final loginState = ViewState<String>.idle().obs;

  bool isNameRequired = true;

  @override
  void onInit() {
    super.onInit();

    // Check for signup deeplink, for web.
    final path = Uri.base.toString();
    // TODO: find better way to do this
    if (path.contains("apiKey")) {
      _verifySignUpDynamicLink(path);
    }
  }

  void submitData() async {
    final name = nameController.text;
    final email = emailController.text;
    if (isNameRequired && name.isEmpty) {
      loginState.value = ViewState.error("Please enter a valid name");
      return;
    }
    if (email.isEmpty || !email.isEmail) {
      loginState.value = ViewState.error("Please enter a valid email");
      return;
    }
    loginState.value = ViewState.loading();
    final params = SendSignUpMagicLinkParams(name, email);

    final result = await _sendSignUpMagicLinkUseCase.call(params);

    result.when(
      success: (value) {
        loginState.value = ViewState.success(email);
        _deeplinkHelper.addDynamicLinkListener(
          (deeplink) => _verifySignUpDynamicLink(deeplink.path),
        );
      },
      error: (exception) {
        loginState.value = ViewState.error(exception.toString());
      },
    );
  }

  void _verifySignUpDynamicLink(String path) async {
    loginState.value = ViewState.loading();
    final result = await _createAccountWithMagicLinkUseCase.call(path);

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
