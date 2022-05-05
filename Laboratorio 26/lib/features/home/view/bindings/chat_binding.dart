import 'package:get/get.dart';
import 'package:yolotl/features/home/view/controllers/chat_controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
