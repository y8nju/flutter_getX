import 'package:get/get.dart';
import 'package:getx_begginer/controllers/list_controller.dart';
import 'package:getx_begginer/controllers/tap_controller.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TapController());
    Get.lazyPut(() => ListController());
  }
}
