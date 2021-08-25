const int $nbsp = 0x00A0;

/// TODO: What is this doing in UiKit
extension StringExtension on String {
  String get nonBreaking => replaceAll(' ', String.fromCharCode($nbsp));
}
