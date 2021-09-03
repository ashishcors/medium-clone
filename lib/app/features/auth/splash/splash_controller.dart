import 'package:domain/domain.dart';
import 'package:medium_clone/app/features/base/base_controller.dart';
import 'package:medium_clone/app/routing/navik.dart';

class SplashController extends BaseController {
  final UserSession _userSession;

  SplashController(this._userSession);

  @override
  bool isAuthenticationRequired() => false;

  @override
  void onInit() {
    super.onInit();
    _checkLoggedInUser();
  }

  Future<void> _checkLoggedInUser() async {
    final result = await _userSession.startSession();
    result.when(success: (value) {
      Navik.toHome(clearCurrent: true);
    }, error: (exception) {
      Navik.toLanding(clearCurrent: true);
    });
  }
}
