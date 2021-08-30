import 'package:medium_clone/app/features/base/base_controller.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/domain/usecase/user/get_current_user_use_case.dart';

class SplashController extends BaseController {
  final GetCurrentUserUseCase _currentUserUseCase;

  SplashController(this._currentUserUseCase);

  @override
  bool isAuthenticationRequired() => false;

  @override
  void onInit() {
    super.onInit();
    _checkLoggedInUser();
  }

  Future<void> _checkLoggedInUser() async {
    final result = await _currentUserUseCase(null, true);
    result.when(success: (value) {
      Navik.toHome(clearCurrent: true);
    }, error: (exception) {
      Navik.toLanding(clearCurrent: true);
    });
  }
}
