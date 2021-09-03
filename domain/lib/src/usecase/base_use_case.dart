import 'package:domain/src/model/safe_result.dart';

abstract class BaseUseCase<Result, Params> {
  Future<SafeResult<Result>> call(Params params);
}
