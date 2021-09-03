import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/uikit/extension/list_extension.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Create a sliver row with max total width constrained to screen width.
///
/// Note: Couldn't find a way to have SliverRow hence using this hack.
/// Using stack with paddings so that items appear to be in row.
/// TODO: figure out SliverRow
class SliverRow extends SliverStack {
  final List<SliverRowItem> sliverRowItems;
  final double horizontalPadding;

  SliverRow({
    this.horizontalPadding = 0,
    required this.sliverRowItems,
    Key? key,
  }) : super(key: key, children: [
          ...sliverRowItems.mapIndexed((index, item) {
            final double totalFlex = sliverRowItems.fold(
                0, (previousValue, element) => previousValue + element.flex);

            final double flexBefore = sliverRowItems.getRange(0, index).fold(
                0, (previousValue, element) => previousValue + element.flex);

            final double flexAfter = sliverRowItems
                .getRange(index + 1, sliverRowItems.length)
                .fold(0,
                    (previousValue, element) => previousValue + element.flex);

            return SliverPadding(
              padding: EdgeInsets.only(
                left: (index == 0)
                    ? horizontalPadding
                    : (Get.width * (flexBefore / totalFlex)),
                right: (index == sliverRowItems.length - 1)
                    ? horizontalPadding
                    : (Get.width * (flexAfter / totalFlex)),
              ),
              sliver: item.sliver,
            );
          })
        ]);
}

class SliverRowItem {
  final int flex;
  final Widget sliver;

  SliverRowItem({required this.sliver, this.flex = 1});
}
