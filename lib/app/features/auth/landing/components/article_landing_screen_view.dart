import 'package:flutter/material.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/user_and_community_view.dart';
import 'package:medium_clone/domain/model/article/article.dart';

class ArticleLandingScreenView extends StatelessWidget {
  final Article article;

  const ArticleLandingScreenView({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              UserAndCommunityView(
                user: article.author,
                community: article.community,
              ),
              const SizedBox(height: 8),
              Text(
                article.title,
                style: Styles.bodyText1
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
              ),
              const SizedBox(height: 8),
              Text(
                article.subtitle ?? "",
                style: Styles.subtitle2
                    ?.copyWith(color: ColorPalette.primary.withAlpha(200)),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "${article.publishedOn.displayFormat()} · ${article.length} min read",
                    style: Styles.caption?.copyWith(
                      color: ColorPalette.primary.withAlpha(200),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ...article.topics.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(
                          e,
                          style: Styles.caption?.copyWith(
                            color: ColorPalette.primary.withAlpha(200),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.bookmark_add_outlined)
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.network(
            article.bannerImageUrl,
            width: 180,
            height: 120,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
