import 'package:flutter/material.dart';

import '../uikit.dart';

class MagicLinkSentView extends StatelessWidget {
  final String description;
  final Function()? onCloseClicked;

  final bool showCloseButton;

  const MagicLinkSentView({
    Key? key,
    required this.description,
    this.onCloseClicked,
    this.showCloseButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          showCloseButton ?Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 36,
                ),
                onPressed: onCloseClicked,
              ),
            ),
            alignment: Alignment.topLeft,
          ) : const SizedBox(height: 52),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Check your inbox",
              style: Styles.headline5?.copyWith(
                color: ColorPalette.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
