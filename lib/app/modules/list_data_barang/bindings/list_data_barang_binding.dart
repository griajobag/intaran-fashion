import 'package:get/get.dart';

import '../controllers/list_data_barang_controller.dart';

class ListDataBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDataBarangController>(
      () => ListDataBarangController(),
    );
  }
}
