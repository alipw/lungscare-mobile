import 'package:get/get.dart';

import '../controllers/berita_page_controller.dart';

class BeritaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritaPageController>(
      () => BeritaPageController(),
    );
  }
} 