import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

extension FirebaseUserExtension on firebase.User {
  User toUser() {
    return User(
      id: uid,
      username: "nameless_fellow",
      name: displayName ?? "Nameless Fellow",
      imageUrl: photoURL ?? "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp",
      joinDate: metadata.creationTime ?? DateTime.now(),
    );
  }
}
