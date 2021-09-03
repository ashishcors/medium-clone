import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:medium_clone/data/repository/auth_repository_impl.dart';
import 'package:medium_clone/data/repository/user_repository_impl.dart';

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
  }
}
