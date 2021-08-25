import 'package:medium_clone/domain/model/safe_result.dart';

abstract class BaseUseCase<Result, Params> {
  Future<SafeResult<Result>> call(Params params);
}
