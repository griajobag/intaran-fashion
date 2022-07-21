import 'package:get/get.dart';

import '../controllers/list_metode_pembayaran_controller.dart';

class ListMetodePembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMetodePembayaranController>(
      () => ListMetodePembayaranController(),
    );
  }
}
