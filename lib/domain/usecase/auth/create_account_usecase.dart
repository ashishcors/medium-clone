import 'package:medium_clone/domain/model/safe_result.dart';
import 'package:medium_clone/domain/model/user/user.dart';
import 'package:medium_clone/domain/usecase/base_use_case.dart';

class CreateAccountUseCase extends BaseUseCase<User, CreateAccountParams> {
  @override
  Future<SafeResult<User>> call(CreateAccountParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class CreateAccountParams {
  final String lastName;
  final String firstName;
  final String email;
  final String password;

  CreateAccountParams(this.lastName, this.firstName, this.email, this.password);
}
