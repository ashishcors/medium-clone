import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/components/article_item_view.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/values/color_palette.dart';
import 'package:medium_clone/app/uikit/widgets/custom_drop_down.dart';
import 'package:medium_clone/data/dummy_data_utils.dart';

import 'home_tab_controller.dart';

class HomeTabPage extends GetView<HomeTabController> {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Following",
                      style: Styles.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorPalette.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: ColorPalette.primary.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Obx(
                  () => CustomDropdown<String>(
                      options: controller.sortOrders,
                      selected: controller.selectedSortOrder.value ??
                          controller.sortOrders.first,
                      selectedBuilder: (item) => Row(
                            children: [
                              Text(
                                item.toUpperCase(),
                                style: Styles.button
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_drop_down_rounded),
                            ],
                          ),
                      itemBuilder: (item) => Text(item),
                      onChanged: (item) {
                        controller.selectedSortOrder.value = item;
                      }),
                ),
              ],
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
