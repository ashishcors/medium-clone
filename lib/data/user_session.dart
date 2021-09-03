import 'package:domain/domain.dart';

/// Maintains current user session.
class UserSession {
  final AuthRepository _authRepository;

  UserSession(this._authRepository);

  bool isLoggedIn() => _authRepository.isUserLoggedIn();
}
