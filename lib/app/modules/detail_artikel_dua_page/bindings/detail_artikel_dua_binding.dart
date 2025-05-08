import 'package:get/get.dart';

import '../controllers/detail_artikel_dua_controller.dart';

class DetailArtikelDuaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailArtikelDuaController>(
      () => DetailArtikelDuaController(),
    );
  }
} 