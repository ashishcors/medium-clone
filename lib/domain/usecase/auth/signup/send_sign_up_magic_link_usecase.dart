import 'package:medium_clone/domain/model/safe_result.dart';
import 'package:medium_clone/domain/repository/auth_repository.dart';
import 'package:medium_clone/domain/usecase/base_use_case.dart';

class SendSignUpMagicLinkUseCase
    extends BaseUseCase<void, SendSignUpMagicLinkParams> {
  final AuthRepository _authRepository;

  SendSignUpMagicLinkUseCase(this._authRepository);

  @override
  Future<SafeResult<void>> call(SendSignUpMagicLinkParams params) {
    return _authRepository.sendSignUpMagicLink(params.fullName, params.email);
  }
}

class SendSignUpMagicLinkParams {
  final String fullName;
  final String email;

  SendSignUpMagicLinkParams(this.fullName, this.email);
}
