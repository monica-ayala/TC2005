import 'package:get/get.dart';
import 'package:yolotl/features/home/view/controllers/menu_controller.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(() => MenuController());
  }
}
