import 'package:medium_clone/domain/model/community/community.dart';
import 'package:medium_clone/domain/model/user/user.dart';

class Article {
  final String id;
  final String publicId;
  final User author;
  final Community? community;
  final String title;
  final String? subtitle;
  final String content;
  final DateTime publishedOn;
  final int length;

  Article({
    required this.id,
    required this.publicId,
    required this.author,
    required this.community,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.publishedOn,
    required this.length,
  });
}
