import 'package:domain/domain.dart';

/// TODO: remove this when done.
@Deprecated("App shouldn't use this, this is just for development.")
abstract class DummyDataUtils {
  static final user1 = User(
    id: "1",
    username: "ashishX21",
    name: "Ashish Suman",
    imageUrl:
        "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp",
    joinDate: DateTime.now(),
  );
  static final community1 = Community(
    id: "1",
    publicId: "ashishX21",
    name: "Gryffindor",
    imageUrl:
        "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp",
    description: "House of bravery",
  );

  static final List<Article> trendingArticles = [
    Article(
      id: "1",
      publicId: "a",
      author: user1,
      community: community1,
      title: "Afghanistan Meant Nothing",
      subtitle: "Subtitle 1",
      content: "Content 1",
      bannerImageUrl:
          "https://cdn.pixabay.com/photo/2014/05/26/13/32/butterfly-354528_960_720.jpg",
      topics: ["Life"],
      publishedOn: DateTime.now(),
      length: 1,
    ),
    Article(
      id: "2",
      publicId: "a",
      author: user1,
      community: null,
      title:
          "Inslee announces educator vaccination requirement and statewide indoor mask",
      subtitle: "Subtitle 1",
      content: "Content 1",
      bannerImageUrl:
          "https://cdn.pixabay.com/photo/2014/05/26/13/32/butterfly-354528_960_720.jpg",
      topics: ["Android"],
      publishedOn: DateTime.now(),
      length: 1,
    ),
    Article(
      id: "3",
      publicId: "a",
      author: user1,
      community: community1,
      title: "5 Online Data Science Courses You Can Finish in 1 Day",
      subtitle: "Subtitle 1",
      content: "Content 1",
      bannerImageUrl:
          "https://cdn.pixabay.com/photo/2014/05/26/13/32/butterfly-354528_960_720.jpg",
      topics: ["Health"],
      publishedOn: DateTime.now(),
      length: 1,
    ),
    Article(
      id: "4",
      publicId: "a",
      author: user1,
      community: null,
      title: "Coinbase launches in Japan",
      subtitle: "Subtitle 1",
      content: "Content 1",
      bannerImageUrl:
          "https://cdn.pixabay.com/photo/2014/05/26/13/32/butterfly-354528_960_720.jpg",
      topics: ["Life", "Career"],
      publishedOn: DateTime.now(),
      length: 1,
    ),
    Article(
      id: "5",
      publicId: "a",
      author: user1,
      community: community1,
      title: "I cut my body fat percentage almost in half. Here’s what I eat.",
      subtitle: "Subtitle 1",
      content: "Content 1",
      bannerImageUrl:
          "https://cdn.pixabay.com/photo/2014/05/26/13/32/butterfly-354528_960_720.jpg",
      topics: ["Life"],
      publishedOn: DateTime.now(),
      length: 1,
    ),
    Article(
      id: "6",
      publicId: "a",
      author: user1,
      community: community1,
      title:
          "The 1Password Disaster (And Two Brilliant 1Password Alternatives)",
      subtitle: "Subtitle 1",
      content: "Content 1",
      bannerImageUrl:
          "https://cdn.pixabay.com/photo/2014/05/26/13/32/butterfly-354528_960_720.jpg",
      topics: ["Meditation"],
      publishedOn: DateTime.now(),
      length: 1,
    ),
  ];
}
