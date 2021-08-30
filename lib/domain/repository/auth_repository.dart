import 'package:medium_clone/domain/model/safe_result.dart';

abstract class AuthRepository {
  Future<SafeResult<void>> sendLoginMagicLink(String email);

  Future<SafeResult<void>> verifyLoginMagicLink(String loginMagicLink);

  Future<SafeResult<void>> sendSignUpMagicLink(String name, String email);

  Future<SafeResult<void>> completeSignUpWithMagicLink(String signUpMagicLink);

  bool isUserLoggedIn();
}
