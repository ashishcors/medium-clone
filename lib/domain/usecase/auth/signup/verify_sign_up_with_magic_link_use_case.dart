import 'package:medium_clone/domain/model/safe_result.dart';
import 'package:medium_clone/domain/repository/auth_repository.dart';
import 'package:medium_clone/domain/usecase/base_use_case.dart';

class CompleteSignUpWithMagicLinkUseCase extends BaseUseCase<void, String> {
  final AuthRepository _authRepository;

  CompleteSignUpWithMagicLinkUseCase(this._authRepository);

  @override
  Future<SafeResult<void>> call(String params) {
    return _authRepository.completeSignUpWithMagicLink(params);
  }
}
