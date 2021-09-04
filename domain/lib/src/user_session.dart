import 'package:domain/domain.dart';

/// This denotes current active user.
class UserSession {
  final AuthRepository _authRepository;

  UserSession._(this._authRepository);

  User? _currentUser;

  /// Return current logged in user. Null if no user is logged in.
  User? get currentUser => _currentUser;

  Future<SafeResult<User>> refreshSession() async {
    final result = await _authRepository.getCurrentUser(true);
    return result.fold((value) {
      _currentUser = value;
      return SafeResult.success(value);
    });
  }

  /// Starts user session.
  /// Call when user signup or login.
  Future<SafeResult<User>> startSession() {
    return refreshSession();
  }

  /// Check if user is logged in.
  bool isLoggedIn() => _currentUser != null;

  /// Singleton instance of UserSession
  static UserSession? _instance;

  /// Creates and starts UserSession.
  static Future<UserSession> getInstance(AuthRepository authRepository) async {
    if (_instance == null) {
      _instance = UserSession._(authRepository);
      await _instance!.startSession();
    }
    return _instance!;
  }
}
