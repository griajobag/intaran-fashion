import 'package:get/get.dart';

import '../controllers/list_catatan_controller.dart';

class ListCatatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListCatatanController>(
      () => ListCatatanController(),
    );
  }
}
