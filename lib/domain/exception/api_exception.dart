/// All know exceptions must be wrapper around this.
class ApiException implements Exception {
  final Object? error;

  final StackTrace? stack;

  ApiException(this.error, [this.stack]);

  @override
  String toString() {
    return error.toString();
  }
}
