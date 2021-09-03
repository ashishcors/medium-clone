import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/data/user_session.dart';
import 'package:medium_clone/main.dart';

/// BaseController for all Views, have some basic common functionalities.
abstract class BaseController extends GetxController {
  final _logoutUseCase = Get.find<LogoutUseCase>();

  final _userSession = Get.find<UserSession>();

  /// Logs out user.
  Future<void> logout() async {
    await _logoutUseCase(null);
    Navik.toLanding(clearCurrent: true);
  }

  /// Indicates whether this screen required authentication.
  bool isAuthenticationRequired() => true;

  @override
  void onInit() {
    super.onInit();
    logger.d("Is Logged in", _userSession.isLoggedIn());
    if (isAuthenticationRequired() && !_userSession.isLoggedIn()) {
      Future.delayed(Duration.zero, () async {
        Navik.toLanding(clearCurrent: true);
      });
    }
  }

  /// Generic exception handler.
  handleException(Exception exception) {
    logger.e(exception);
    if (exception is UnauthorizedException) {
      logout();
    } else if (exception is ApiException) {
      Get.snackbar("Error", exception.toString());
    } else {
      Get.snackbar(
        "Unknown Error",
        "An unknown error occurred. Please try again later.",
      );
    }
  }
}
