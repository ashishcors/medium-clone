import 'package:medium_clone/domain/model/safe_result.dart';
import 'package:medium_clone/domain/model/user/user.dart';
import 'package:medium_clone/domain/usecase/base_use_case.dart';

class LoginUseCase extends BaseUseCase<User, LoginParams> {
  @override
  Future<SafeResult<User>> call(LoginParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);
}
