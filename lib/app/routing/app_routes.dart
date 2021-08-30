part of 'app_pages.dart';

/// This should not be used for navigation. Use Navik.
abstract class Routes {
  static const String SPLASH = '/';

  /// home for unauthorized users
  static const String LANDING = '/welcome';

  /// home for authorized users
  static const String HOME = '/home';

  /// Login landing page for mobile
  static const String LOGIN_LANDING = '/welcome-back';

  static const String LOGIN = '/login';
  static const String CREATE_ACCOUNT = '/create-account';
  static const String FORGOT_PASSWORD = '/forgot-password';
  static const String EMAIL_VERIFICATION = '/email-verification';
}
