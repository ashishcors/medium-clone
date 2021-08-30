import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/user_and_community_view.dart';
import 'package:medium_clone/domain/model/article/article.dart';

/// View for ranked trending article.
class TrendingArticleView extends StatelessWidget {
  final int rank;
  final Article article;

  const TrendingArticleView({
    Key? key,
    required this.rank,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          rank.toString().padLeft(2, "0"),
          style: Styles.bodyText1?.copyWith(
            color: ColorPalette.primary.withAlpha(50),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            UserAndCommunityView(
              user: article.author,
              community: article.community,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: (Get.width - 360) / 3 - 72,
              child: Text(
                article.title,
                style: Styles.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${article.publishedOn.displayFormat()} · ${article.length} min read",
              style: Styles.caption?.copyWith(
                color: ColorPalette.primary.withAlpha(200),
              ),
            )
          ],
        ),
      ],
    );
  }
}
