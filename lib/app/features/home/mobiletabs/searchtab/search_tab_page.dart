import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/components/article_item_view.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/section_header_view.dart';
import 'package:medium_clone/data/dummy_data_utils.dart';

import 'search_tab_controller.dart';

class SearchTabPage extends GetView<SearchTabController> {
  const SearchTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Explore",
                  style: Styles.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorPalette.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: ColorPalette.primary.withOpacity(0.5),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Search Medium",
                        style: Styles.caption?.copyWith(
                          color: ColorPalette.primary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 24),
            child: SizedBox(
              height: 36,
              child: ListView(
                children: ["Technology", "Money", "Business", "Productivity"]
                    .map(
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
                    )
                    .toList(),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SectionHeaderView(
              title: "RECOMMENDED FOR YOU",
              icon: Icons.library_books_outlined,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            (DummyDataUtils.trendingArticles + DummyDataUtils.trendingArticles)
                .map(
                  (e) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ArticleItemView(article: e),
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: ColorPalette.primary.withOpacity(0.05),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
