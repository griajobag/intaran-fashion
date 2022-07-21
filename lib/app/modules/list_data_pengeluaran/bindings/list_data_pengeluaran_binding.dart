import 'package:get/get.dart';

import '../controllers/list_data_pengeluaran_controller.dart';

class ListDataPengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDataPengeluaranController>(
      () => ListDataPengeluaranController(),
    );
  }
}
