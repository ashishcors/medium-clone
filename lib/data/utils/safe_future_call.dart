import 'package:domain/domain.dart';

Future<SafeResult<T>> safeFutureCall<T>(Future<T> Function() block) async {
  try {
    final result = await block();
    return SafeResult.success(result);
  } catch (e) {
    if (e is Exception) {
      return SafeResult.failure(e);
    } else {
      return SafeResult.failure(Exception("An error occurred"));
    }
  }
}
