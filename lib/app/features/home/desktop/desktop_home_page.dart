import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/components/article_item_view.dart';
import 'package:medium_clone/app/features/auth/landing/components/trending_article_view.dart';
import 'package:medium_clone/app/features/home/desktop/desktop_home_controller.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/values/color_palette.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';
import 'package:medium_clone/app/uikit/widgets/section_header_view.dart';
import 'package:medium_clone/app/uikit/widgets/sliver_row.dart';
import 'package:medium_clone/app/uikit/widgets/user_avatar.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';
import 'package:medium_clone/data/dummy_data_utils.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DesktopHomePage extends GetView<DesktopHomeController> {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 12,
            toolbarHeight: 72,
            forceElevated: true,
            shadowColor: ColorPalette.primary.withOpacity(0.2),
            backgroundColor: ColorPalette.background,
            titleSpacing: 180,
            title: const AppLogo(showTitle: true, size: 24),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: ColorPalette.primary.withOpacity(0.5),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.bookmarks_outlined,
                  color: ColorPalette.primary.withOpacity(0.5),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: ColorPalette.primary.withOpacity(0.5),
                ),
                onPressed: () {},
              ),
              Align(
                alignment: Alignment.center,
                child: WizButton(
                  "Upgrade",
                  color: ColorPalette.background,
                  textColor: ColorPalette.textPrimary,
                  borderColor: ColorPalette.primary.withOpacity(0.5),
                  textSize: 12,
                  containerPadding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 16),
              UserAvatar(controller.currentUser.imageUrl, radius: 24),
              const SizedBox(width: 180),
            ],
          ),
          const SliverPadding(
            padding:
                EdgeInsets.only(left: 180, right: 180, top: 36, bottom: 16),
            sliver: SliverToBoxAdapter(
                child: SectionHeaderView(
              title: "TRENDING ON WIZDOM",
              icon: FontAwesomeIcons.chartLine,
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 180),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate.fixed(
                DummyDataUtils.trendingArticles
                    .mapIndexed(
                      (i, e) => TrendingArticleView(rank: i + 1, article: e),
                    )
                    .toList(),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 3, crossAxisSpacing: 24),
            ),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverRow(
            horizontalPadding: 180,
            sliverRowItems: [
              SliverRowItem(
                flex: 5,
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    (DummyDataUtils.trendingArticles +
                            DummyDataUtils.trendingArticles)
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ArticleItemView(article: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SliverRowItem(
                flex: 3,
                sliver: const _HomeRightPaneView(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeRightPaneView extends StatelessWidget {
  const _HomeRightPaneView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = _buildChild();
    return SliverPinnedHeader(child: child);
  }

  Widget _buildChild() {
    return Padding(
      padding: const EdgeInsets.only(right: 0, left: 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: ColorPalette.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _sectionTitleText("WRITE ON WIZDOM"),
                    const Spacer(),
                    Icon(
                      Icons.close,
                      size: 16,
                      color: ColorPalette.primary.withOpacity(0.7),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  "New writer FAQ",
                  style: Styles.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Expert writing advice",
                  style: Styles.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Grow your readership",
                  style: Styles.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                WizButton(
                  "Start Writing",
                  textSize: 12,
                  containerPadding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          _sectionTitleText("Recommended Topics"),
          const SizedBox(height: 24),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              "Technology",
              "Money",
              "Business",
              "Productivity",
              "Psychology",
              "Mindfulness",
              "Art",
            ]
                .map(
                  (e) => Chip(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    label: Text(e, style: Styles.subtitle2),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          _sectionTitleText("Who to follow"),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          _sectionTitleText("Reading List"),
          Text("Click the  on any story to easily add it to your reading list or a custom list that you can share."),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          Wrap(
            children: [
              "Help",
              "Status",
              "Writers",
              "Blog",
              "Careers",
              "Privacy",
              "Terms",
              "About",
            ].map((e) => Text(e)).toList(),
            spacing: 16.0,
            runSpacing: 8.0,
          )
        ],
      ),
    );
  }

  Text _sectionTitleText(String text) {
    return Text(
      text.toUpperCase(),
      style: Styles.caption?.copyWith(
        color: ColorPalette.primary.withOpacity(0.7),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
