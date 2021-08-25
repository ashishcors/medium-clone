import 'package:intl/intl.dart';

/// TODO: What is this doing in UiKit
extension DateTimeExt on DateTime {
  String format(String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }

  String displayFormat() => format("MMM d");
}
