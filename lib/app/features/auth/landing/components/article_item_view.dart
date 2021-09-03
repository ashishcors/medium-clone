import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/auth_dialog.dart';
import 'package:medium_clone/app/features/auth/landing/components/article_item_controller.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/user_and_community_view.dart';

class ArticleItemView extends StatelessWidget {
  final controller = Get.find<ArticleItemController>();

  final Article article;

  ArticleItemView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return Padding(
      padding: isMobile
          ? const EdgeInsets.symmetric(horizontal: 24)
          : const EdgeInsets.all(0),
      child: Row(
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
                  style: Styles.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 16 : 20,
                  ),
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
                      "${article.publishedOn.displayFormat()} · ${article.length} min${isMobile ? '' : ' read'}",
                      style: Styles.caption?.copyWith(
                        color: ColorPalette.primary.withAlpha(200),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (!isMobile)
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
                    IconButton(
                      icon: const Icon(Icons.bookmark_add_outlined),
                      onPressed: () {
                        Navik.authDialog(AuthDialogEntryPoint.bookmarkArticle);
                      },
                    ),
                    if (controller.isUserLoggedIn)
                      IconButton(
                        icon:
                            Icon(isMobile ? Icons.more_vert : Icons.more_horiz),
                        onPressed: () {
                          Navik.authDialog(
                              AuthDialogEntryPoint.bookmarkArticle);
                        },
                      ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 0 : 16.0),
            child: Image.network(
              article.bannerImageUrl,
              width: isMobile ? 50 : 180,
              height: isMobile ? 50 : 120,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
