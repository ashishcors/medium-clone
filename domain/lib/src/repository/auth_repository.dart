import 'package:domain/src/model.dart';

abstract class AuthRepository {
  Future<SafeResult<void>> sendLoginMagicLink(String email);

  Future<SafeResult<void>> verifyLoginMagicLink(String loginMagicLink);

  Future<SafeResult<void>> sendSignUpMagicLink(String name, String email);

  Future<SafeResult<void>> completeSignUpWithMagicLink(String signUpMagicLink);

  Future<SafeResult<User>> getCurrentUser(bool refreshSession);
}
