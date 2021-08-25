/// A wrapper to get result safely.
///
/// The data is received as [Success] and error is received as [Failure].
abstract class SafeResult<T> {
  const SafeResult();

  /// A conditional expression on [SafeResult]. Similar to kotlin `when`.
  B when<B>(
    B Function(T value, [String? message]) onSuccess,
    B Function(Exception exception) onFailure,
  );

  /// Similar to [when]. No `onFailure` param required.
  /// Returns [Failure] on failure.
  /// Use only when return type is [SafeResult<T>].
  SafeResult<B> fold<B>(
      SafeResult<B> Function(T value, [String? message]) onSuccess);

  /// Same as [fold] just takes a future and returns a future.
  Future<SafeResult<B>> foldAsync<B>(
    Future<SafeResult<B>> Function(T value, [String? message]) onSuccess,
  );
}

/// Success result wrapper.
class Success<T> extends SafeResult<T> {
  final T value;
  final String? message;

  Success(this.value, [this.message]);

  @override
  B when<B>(
    B Function(T value, [String? message]) onSuccess,
    B Function(Exception exception) onFailure,
  ) =>
      onSuccess(value, message);

  @override
  SafeResult<B> fold<B>(
    SafeResult<B> Function(T value, [String? message]) onSuccess,
  ) =>
      onSuccess(value, message);

  @override
  Future<SafeResult<B>> foldAsync<B>(
    Future<SafeResult<B>> Function(T value, [String? message]) onSuccess,
  ) =>
      onSuccess(value, message);
}

/// Failure result/exception wrapper.
class Failure<T> extends SafeResult<T> {
  final Exception exception;

  Failure(Object object)
      : exception = (object is Exception)
            ? object
            : Exception('An unknown error occurred.');

  @override
  B when<B>(
    B Function(T value) onSuccess,
    B Function(Exception exception) onFailure,
  ) =>
      onFailure(exception);

  @override
  SafeResult<B> fold<B>(
    SafeResult<B> Function(T value, [String? message]) onSuccess,
  ) =>
      Failure(exception);

  @override
  Future<SafeResult<B>> foldAsync<B>(
    Future<SafeResult<B>> Function(T value, [String? message]) onSuccess,
  ) =>
      Future.value(Failure(exception));
}
