import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/auth_dialog.dart';
import 'package:medium_clone/app/features/auth/landing/components/trending_article_view.dart';
import 'package:medium_clone/app/features/auth/landing/components/web_welcome_banner.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/values/color_palette.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';
import 'package:medium_clone/data/dummy_data_utils.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'components/article_landing_screen_view.dart';

class DesktopLandingPage extends StatefulWidget {
  const DesktopLandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopLandingPage> createState() => _DesktopLandingPageState();
}

class _DesktopLandingPageState extends State<DesktopLandingPage> {
  final ScrollController _scrollController = ScrollController();

  // TODO - animate this effect.
  bool _scrolledPastBanner = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrolledPastBanner = _scrollController.position.pixels >= 440;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            elevation: 0,
            forceElevated: true,
            shape: const Border(bottom: BorderSide()),
            backgroundColor: _scrolledPastBanner
                ? ColorPalette.background
                : ColorPalette.secondary,
            pinned: true,
            titleSpacing: 180,
            title: const AppLogo(showTitle: true, size: 24),
            actions: [
              Align(
                alignment: Alignment.center,
                child: WizTextButton(
                  "Our story",
                  onPressed: () {},
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: WizTextButton(
                  "Membership",
                  onPressed: () {},
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: WizTextButton(
                  "Write",
                  onPressed: () {},
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: WizTextButton(
                  "Sign In",
                  onPressed: () {
                    Navik.authDialog(AuthDialogEntryPoint.signIn);
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: WizButton(
                  "Get started",
                  onPressed: () {
                    Navik.authDialog(AuthDialogEntryPoint.getStarted);
                  },
                  color: _scrolledPastBanner
                      ? ColorPalette.green
                      : ColorPalette.primary,
                  textColor: _scrolledPastBanner || !Get.isDarkMode
                      ? ColorPalette.white
                      : ColorPalette.black,
                ),
              ),
              const SizedBox(width: 180),
            ],
          ),
          const SliverToBoxAdapter(child: WebWelcomeBanner()),
          SliverPadding(
            padding: const EdgeInsets.only(
                left: 180, right: 180, top: 36, bottom: 16),
            sliver: SliverToBoxAdapter(
                child: Row(
              children: [
                const Icon(FontAwesomeIcons.chartLine),
                const SizedBox(width: 8),
                Text(
                  "TRENDING ON WIZDOM",
                  style: Styles.caption?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
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
          // Couldn't find a way to have SliverRow hence using this hack. Using
          // stack with paddings to that items appear to be in row
          // TODO: figure out SliverRow
          SliverStack(
            children: [
              SliverPadding(
                padding: EdgeInsets.only(left: 180, right: (Get.width * 0.45)),
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    (DummyDataUtils.trendingArticles +
                            DummyDataUtils.trendingArticles)
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ArticleLandingScreenView(article: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: (Get.width * 0.55), right: 180),
                sliver: const LandingAdditionalInfoView(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LandingAdditionalInfoView extends StatelessWidget {
  const LandingAdditionalInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = _buildChild();
    return SliverPinnedHeader(child: child);
  }

  Widget _buildChild() {
    return Padding(
      padding: const EdgeInsets.only(right: 48, left: 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Text(
            "DISCOVER MORE OF WHAT MATTERS TO YOU",
            style: Styles.caption?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            children: [
              "Self",
              "Relationships",
              "Data Science",
              "Programming",
              "Productivity",
              "Javascript",
              "Machine Learning",
              "Politics",
              "Health",
            ]
                .map(
                  (e) => Container(
                    child: Text(
                      e,
                      style: Styles.caption,
                    ),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorPalette.primary.withAlpha(50)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(8.0),
                  ),
                )
                .toList(),
            spacing: 8.0,
            runSpacing: 8.0,
          ),
          const SizedBox(height: 16),
          Text(
            "See all topics",
            style: Styles.subtitle1?.copyWith(
              color: ColorPalette.green,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
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
}
