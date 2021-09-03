import 'package:domain/src/model/safe_result.dart';
import 'package:domain/src/model/user/user.dart';

abstract class UserRepository {
  Future<SafeResult<User>> getCurrentUser(bool performSync);
}
