import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:medium_clone/data/modelextension/user_extension.dart';

class UserRepositoryImpl extends UserRepository {
  final _auth = firebase.FirebaseAuth.instance;

  @override
  Future<SafeResult<User>> getCurrentUser(bool performSync) async {
    if (performSync) {
      await _auth.currentUser?.reload();
    }

    final user = _auth.currentUser?.toUser();

    if (user != null) {
      return SafeResult.success(user);
    }
    return SafeResult.failure(UnAuthorizedException());
  }
}
