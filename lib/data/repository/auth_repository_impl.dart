import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:get_storage/get_storage.dart';
import 'package:medium_clone/app/routing/app_pages.dart';
import 'package:medium_clone/data/config.dart';
import 'package:medium_clone/data/modelextension/user_extension.dart';
import 'package:medium_clone/data/utils/safe_future_call.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _auth = FirebaseAuth.instance;

  /// Store email in local storage for sign-in, for verification.
  final _emailForSignIn = "".val("emailForSignIn");

  /// Store email & name in local storage for sign-up, for verification.
  final _emailForSignUp = "".val("emailForSignUp");
  final _nameForSignUp = "".val("nameForSignUp");

  @override
  Future<SafeResult<void>> sendLoginMagicLink(String email) async {
    final loginCallbackUrl = "${Config.webUrl}${Routes.LOGIN}";
    return (await _sendMagicLink(email, loginCallbackUrl)).fold((value) {
      _emailForSignIn.val = email;
      return SafeResult.success(null);
    });
  }

  /// Sends login magic link to given email.
  /// [callbackUrl] is where we want to redirect the user when link is clicked in web.
  Future<SafeResult<void>> _sendMagicLink(String email, String callbackUrl) {
    var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: callbackUrl,
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: Config.iOSBundleId,
      androidPackageName: Config.androidPackageName,
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '21',
    );

    return safeFutureCall(
      () => _auth.sendSignInLinkToEmail(email: email, actionCodeSettings: acs),
    );
  }

  @override
  Future<SafeResult<void>> verifyLoginMagicLink(String loginMagicLink) async {
    final emailForSignIn = _emailForSignIn.val;

    if (emailForSignIn.isEmpty) {
      return SafeResult.failure(UnAuthorizedException());
    }
    // clear email
    _emailForSignIn.val = "";

    if (_auth.isSignInWithEmailLink(loginMagicLink)) {
      return safeFutureCall(
        () => _auth.signInWithEmailLink(
          email: emailForSignIn,
          emailLink: loginMagicLink,
        ),
      );
    } else {
      return SafeResult.failure(Exception("Invalid magic link."));
    }
  }

  @override
  Future<SafeResult<void>> sendSignUpMagicLink(
    String name,
    String email,
  ) async {
    final signUpCallbackUrl = "${Config.webUrl}${Routes.CREATE_ACCOUNT}";
    return (await _sendMagicLink(email, signUpCallbackUrl)).fold((value) {
      _emailForSignUp.val = email;
      _nameForSignUp.val = name;
      return SafeResult.success(null);
    });
  }

  @override
  Future<SafeResult<void>> completeSignUpWithMagicLink(
    String signUpMagicLink,
  ) async {
    final emailForSignUp = _emailForSignUp.val;
    var nameForSignUp = _nameForSignUp.val;
    if (nameForSignUp.isEmpty) nameForSignUp = "Nameless fellow";

    if (emailForSignUp.isEmpty) {
      return SafeResult.failure(UnAuthorizedException());
    }
    // clear name & email
    _emailForSignUp.val = "";
    _nameForSignUp.val = "";

    if (_auth.isSignInWithEmailLink(signUpMagicLink)) {
      final createAccountResult =
          await safeFutureCall(() => _auth.signInWithEmailLink(
                email: emailForSignUp,
                emailLink: signUpMagicLink,
              ));
      return createAccountResult.foldAsync(
        (value) => _updateUserDisplayName(nameForSignUp),
      );
    } else {
      return SafeResult.failure(Exception("Invalid magic link."));
    }
  }

  Future<SafeResult<void>> _updateUserDisplayName(
    String name,
  ) async {
    return safeFutureCall(
      () {
        final currentUser = _auth.currentUser;
        if (currentUser == null) {
          throw UnAuthorizedException();
        }
        return currentUser.updateDisplayName(name);
      },
    );
  }

  @override
  Future<SafeResult<User>> getCurrentUser(bool refreshSession) async {
    if (refreshSession) {
      await _auth.currentUser?.reload();
    }

    final user = _auth.currentUser?.toUser();

    if (user != null) {
      return SafeResult.success(user);
    }
    return SafeResult.failure(UnAuthorizedException());
  }
}
