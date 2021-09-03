import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/user_avatar.dart';

import 'account_tab_controller.dart';

class AccountTabPage extends GetView<AccountTabController> {
  const AccountTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.more_horiz, size: 32),
                  ),
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserAvatar(controller.currentUser.imageUrl, radius: 48),
                    const SizedBox(width: 16),
                    Text(
                      controller.currentUser.name,
                      style: Styles.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("1 Following"),
                    Text("0 Followers"),
                    Text("Lists"),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
