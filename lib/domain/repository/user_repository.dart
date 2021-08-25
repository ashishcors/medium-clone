import 'package:medium_clone/domain/model/safe_result.dart';
import 'package:medium_clone/domain/model/user/user.dart';

abstract class UserRepository {
  Future<SafeResult<User>> getCurrentUser(bool performSync);
}
