import 'package:flutter/material.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';

class WebWelcomeBanner extends StatelessWidget {
  const WebWelcomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 180, right: 180, top: 24, bottom: 0),
      decoration: BoxDecoration(
          color: ColorPalette.secondary,
          border: const Border(bottom: BorderSide())),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Wizdom is a place to write, read, and connect",
                  style: Styles.headline2,
                ),
                Text(
                  "It's easy and free to post your thinking on any topic and\nconnect with millions of readers.",
                  style: Styles.bodyText1,
                ),
                const SizedBox(height: 24),
                WizButton(
                  "Start Writing",
                  color: ColorPalette.white,
                  textColor: ColorPalette.black,
                  borderColor: ColorPalette.black,
                  onPressed: () {},
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 360,
              child: Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.network(
                    Assets.hogwartsLogo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
