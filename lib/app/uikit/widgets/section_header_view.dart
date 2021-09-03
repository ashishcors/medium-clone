import 'package:flutter/material.dart';
import 'package:medium_clone/app/uikit/uikit.dart';

class SectionHeaderView extends StatelessWidget {
  final IconData? icon;
  final String title;
  final double fontSize;

  const SectionHeaderView(
      {Key? key, this.icon, required this.title, this.fontSize = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) Icon(icon),
        if (icon != null) const SizedBox(width: 8),
        Text(
          title,
          style: Styles.caption?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        )
      ],
    );
  }
}
