import 'package:medium_clone/domain/exception/unauthorized_exception.dart';
import 'package:medium_clone/domain/model/safe_result.dart';
import 'package:medium_clone/domain/model/user/user.dart';
import 'package:medium_clone/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<SafeResult<User>> getCurrentUser(bool performSync) {
    return Future.delayed(
        const Duration(seconds: 3), () => Failure(UnAuthorizedException()));

    // return Future.value(Success(User(
    //   "id",
    //   "ashishx21",
    //   "Ashish",
    //   "Suman",
    //   DateTime.now(),
    // )));
  }
}
