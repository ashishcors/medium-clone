import 'package:get/get.dart';
import 'package:medium_clone/data/repository/auth_repository_impl.dart';
import 'package:medium_clone/data/repository/user_repository_impl.dart';
import 'package:medium_clone/data/user_session.dart';
import 'package:medium_clone/domain/repository/auth_repository.dart';
import 'package:medium_clone/domain/repository/user_repository.dart';
import 'package:medium_clone/domain/usecase/auth/logout_use_case.dart';
import 'package:medium_clone/domain/usecase/user/get_current_user_use_case.dart';

/// All app level dependencies goes here.
/// Consider this apps di folder.
/// TODO: find ways to better organize this.
abstract class AppBindings {
  static Future<void> init() async {
    _repositoryModule();
    _globalUseCaseModule();

    // User session
    Get.put<UserSession>(UserSession(Get.find()));
  }

  static _repositoryModule() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
      fenix: true,
    );
  }

  static void _globalUseCaseModule() {
    Get.lazyPut<LogoutUseCase>(
      () => LogoutUseCase(),
      fenix: true,
    );

    Get.lazyPut<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(Get.find()),
      fenix: true,
    );
  }
}
