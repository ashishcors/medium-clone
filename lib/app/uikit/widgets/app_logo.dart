import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:medium_clone/app/uikit/values/color_palette.dart';

import '../uikit.dart';

/// App logo.
class AppLogo extends StatelessWidget {
  final double? size;
  final double? textSize;
  final bool showTitle;

  const AppLogo({Key? key, this.size, this.showTitle = false, this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Logo(size: size ?? 100),
        if (showTitle) const SizedBox(width: 8),
        if (showTitle)
          Text(
            "app_name".tr,
            style: Styles.headline1?.copyWith(
              letterSpacing: context.isDesktop ? -2 : -4,
              color: ColorPalette.textPrimary,
              fontSize: (textSize ?? size ?? 100),
            ),
          ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.bolt,
      color: ColorPalette.textPrimary,
      size: size,
    );
  }
}
