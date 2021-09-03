import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/uikit/uikit.dart';

import 'lists_tab_controller.dart';

class ListsTabPage extends GetView<ListsTabController> {
  const ListsTabPage({Key? key}) : super(key: key);

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
                  "Your Lists",
                  style: Styles.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
