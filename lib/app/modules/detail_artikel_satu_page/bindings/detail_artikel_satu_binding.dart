import 'package:get/get.dart';

import '../controllers/detail_artikel_satu_controller.dart';

class DetailArtikelSatuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailArtikelSatuController>(
      () => DetailArtikelSatuController(),
    );
  }
} 