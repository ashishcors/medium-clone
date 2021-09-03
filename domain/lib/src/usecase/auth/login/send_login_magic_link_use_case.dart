import 'package:domain/src/model/safe_result.dart';
import 'package:domain/src/repository/auth_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';

class SendLoginMagicLinkUseCase
    extends BaseUseCase<void, SendLoginMagicLinkParams> {
  final AuthRepository _authRepository;

  SendLoginMagicLinkUseCase(this._authRepository);

  @override
  Future<SafeResult<void>> call(SendLoginMagicLinkParams params) {
    return _authRepository.sendLoginMagicLink(params.email);
  }
}

class SendLoginMagicLinkParams {
  final String email;

  SendLoginMagicLinkParams(this.email);
}
