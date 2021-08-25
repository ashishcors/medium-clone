/// All know exceptions must be wrapper around this.
class ApiException implements Exception {
  final List<String> messages;
  final int errorCode;

  final String message;

  final StackTrace? stack;

  ApiException(this.messages, this.errorCode, [this.stack])
      : message = messages.map((e) => e.endsWith(".") ? e : "$e.").join(" ");

  @override
  String toString() {
    return message;
  }
}
