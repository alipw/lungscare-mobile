import 'package:get/get.dart';
import '../../chat_page/controllers/chat_page_controller.dart';

class KonsultasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatPageController>(
      () => ChatPageController(),
    );
  }
}