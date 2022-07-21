import 'package:get/get.dart';

import '../controllers/list_transaksi_controller.dart';

class ListTransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTransaksiController>(
      () => ListTransaksiController(),
    );
  }
}
