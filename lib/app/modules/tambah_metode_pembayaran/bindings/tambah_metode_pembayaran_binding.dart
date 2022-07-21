import 'package:get/get.dart';

import '../controllers/tambah_metode_pembayaran_controller.dart';

class TambahMetodePembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahMetodePembayaranController>(
      () => TambahMetodePembayaranController(),
    );
  }
}
