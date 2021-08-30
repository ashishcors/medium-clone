class ViewState<T> {
  ViewState._();

  factory ViewState.idle() = _Idle;

  factory ViewState.loading() = _Loading;

  factory ViewState.success(T data) = _Success;

  factory ViewState.error(String? message) = _Error;

  B when<B>({
    required B Function() idle,
    required B Function() loading,
    required B Function(T value) success,
    required B Function(String? message) error,
  }) {
    if (this is _Idle) {
      return idle();
    } else if (this is _Loading) {
      return loading();
    } else if (this is _Success) {
      return success((this as _Success).data);
    } else if (this is _Error) {
      return error((this as _Error).message);
    } else {
      throw "Unreachable state.";
    }
  }
}

class _Idle<T> extends ViewState<T> {
  _Idle() : super._();
}

class _Loading<T> extends ViewState<T> {
  _Loading() : super._();
}

class _Success<T> extends ViewState<T> {
  final T data;

  _Success(this.data) : super._();
}

class _Error<T> extends ViewState<T> {
  final String? message;

  _Error(this.message) : super._();
}
