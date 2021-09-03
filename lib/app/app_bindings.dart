import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/components/article_item_controller.dart';
import 'package:medium_clone/data/repository/auth_repository_impl.dart';
import 'package:medium_clone/data/repository/user_repository_impl.dart';

/// All app level dependencies goes here.
/// Consider this apps di folder.
/// TODO: find ways to better organize this.
abstract class AppBindings {
  static Future<void> init() async {
    _repositoryModule();
    _globalUseCaseModule();
    _globalControllerModule();

    // User session
    await Get.putAsync(() => UserSession.getInstance(Get.find()));
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

  static void _globalControllerModule() {
    // TODO: bad idea
    Get.lazyPut<ArticleItemController>(
      () => ArticleItemController(),
      fenix: true,
    );
  }
}
