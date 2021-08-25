class User {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final DateTime joinDate;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.joinDate,
  });

  String get name => "$firstName $lastName";
}
