import 'package:domain/src/model/safe_result.dart';
import 'package:domain/src/model/user/user.dart';
import 'package:domain/src/repository/user_repository.dart';
import 'package:domain/src/usecase/base_sync_use_case.dart';

class GetCurrentUserUseCase extends BaseSyncUseCase<User, void> {
  final UserRepository _userRepository;

  GetCurrentUserUseCase(this._userRepository);

  @override
  Future<SafeResult<User>> call(
    void params, [
    bool performSync = false,
  ]) {
    return _userRepository.getCurrentUser(performSync);
  }
}
