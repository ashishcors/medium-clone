import 'package:domain/src/model/safe_result.dart';
import 'package:domain/src/repository/auth_repository.dart';
import 'package:domain/src/use_case.dart';

class CompleteSignUpWithMagicLinkUseCase extends BaseUseCase<void, String> {
  final AuthRepository _authRepository;

  CompleteSignUpWithMagicLinkUseCase(this._authRepository);

  @override
  Future<SafeResult<void>> call(String params) {
    return _authRepository.completeSignUpWithMagicLink(params);
  }
}
