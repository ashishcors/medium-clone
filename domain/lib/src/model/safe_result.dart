/// A wrapper to get result safely.
///
/// The data is received as [SafeResult.success] and error is received as [SafeResult.failure].
class SafeResult<T> {
  SafeResult._();

  factory SafeResult.success(T data) = _Success;

  factory SafeResult.failure(Exception exception) = _Failure;

  /// A conditional expression on [SafeResult]. Similar to kotlin `when`.
  B when<B>({
    required B Function(T value) success,
    required B Function(Exception exception) error,
  }) {
    if (this is _Success) {
      return success((this as _Success).data);
    } else if (this is _Failure) {
      return error((this as _Failure).exception);
    } else {
      throw "Unreachable state.";
    }
  }

  /// Similar to [when]. No `onFailure` param required.
  /// Returns [SafeResult.failure] on failure.
  /// Use only when return type is [SafeResult<T>].
  SafeResult<B> fold<B>(SafeResult<B> Function(T value) onSuccess) {
    if (this is _Failure) {
      return SafeResult.failure((this as _Failure).exception);
    } else {
      return onSuccess((this as _Success).data);
    }
  }

  /// Same as [fold] just takes a future and returns a future.
  Future<SafeResult<B>> foldAsync<B>(
    Future<SafeResult<B>> Function(T value) onSuccess,
  ) async {
    if (this is _Failure) {
      return SafeResult.failure((this as _Failure).exception);
    } else {
      return onSuccess((this as _Success).data);
    }
  }
}

class _Success<T> extends SafeResult<T> {
  final T data;

  _Success(this.data) : super._();
}

class _Failure<T> extends SafeResult<T> {
  final Exception exception;

  _Failure(this.exception) : super._();
}
