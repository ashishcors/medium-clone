import 'package:medium_clone/domain/repository/auth_repository.dart';

/// Maintains current user session.
class UserSession {
  final AuthRepository _authRepository;

  UserSession(this._authRepository);

  bool isLoggedIn() => _authRepository.isUserLoggedIn();
}
