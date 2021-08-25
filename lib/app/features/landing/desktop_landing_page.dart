import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medium_clone/app/features/landing/web_welcome_banner.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';
import 'package:medium_clone/app/uikit/widgets/trending_article_view.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';
import 'package:medium_clone/data/dummy_data_utils.dart';

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
                ? ColorPalette.white
                : ColorPalette.secondary,
            pinned: true,
            titleSpacing: 180,
            title: const Expanded(child: AppLogo(showTitle: true, size: 24)),
            actions: [
              WizTextButton(
                "Our story",
                onPressed: () {},
              ),
              WizTextButton(
                "Membership",
                onPressed: () {},
              ),
              WizTextButton(
                "Write",
                onPressed: () {},
              ),
              WizTextButton(
                "Sign In",
                onPressed: () {},
              ),
              WizButton(
                "Sign In",
                onPressed: () {},
                color: _scrolledPastBanner
                    ? ColorPalette.green
                    : ColorPalette.primary,
                textColor: _scrolledPastBanner
                    ? ColorPalette.white
                    : ColorPalette.textPrimary,
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
        ],
      ),
    );
  }
}
