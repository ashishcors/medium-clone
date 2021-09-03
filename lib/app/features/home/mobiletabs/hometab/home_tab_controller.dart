import 'package:get/get.dart';
import 'package:medium_clone/app/features/base/base_controller.dart';

class HomeTabController extends BaseController {
  final sortOrders = ["Top Stories", "Most Recent"];

  final selectedSortOrder = RxnString();
}
