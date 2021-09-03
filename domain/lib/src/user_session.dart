import 'package:domain/domain.dart';

/// This denotes current active user.
class UserSession {
  final AuthRepository _authRepository;

  UserSession(this._authRepository);

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<SafeResult<User>> refreshSession() async {
    final result = await _authRepository.getCurrentUser(true);
    return result.fold((value) {
      _currentUser = value;
      return SafeResult.success(value);
    });
  }

  Future<SafeResult<User>> startSession() async {
    return refreshSession();
  }

  bool isLoggedIn() => _currentUser != null;
}
