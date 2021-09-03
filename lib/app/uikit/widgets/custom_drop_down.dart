import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> options;
  final T? selected;
  final Widget Function(T) selectedBuilder;
  final Widget Function(T) itemBuilder;
  final void Function(T?)? onChanged;

  /// Widget to show when [selected] is `null`
  final Widget? hint;

  const CustomDropdown({
    Key? key,
    required this.options,
    required this.selected,
    required this.selectedBuilder,
    required this.itemBuilder,
    required this.onChanged,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      hint: (selected == null) ? hint : null,
      itemHeight: null,
      value: selected,
      items: options.map((e) {
        return DropdownMenuItem(
          value: e,
          child: itemBuilder(e),
        );
      }).toList(),
      onChanged: onChanged,
      selectedItemBuilder: (c) => options.map(selectedBuilder).toList(),
      underline: const SizedBox.shrink(),
      icon: const SizedBox.shrink(),
    );
  }
}
