import 'package:domain/src/model/community/community.dart';
import 'package:domain/src/model/user/user.dart';

class Article {
  final String id;
  final String publicId;
  final User author;
  final Community? community;
  final String title;
  final String? subtitle;
  final String bannerImageUrl;
  final String content;
  final List<String> topics;
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
    required this.bannerImageUrl,
    required this.topics,
    required this.publishedOn,
    required this.length,
  });
}
