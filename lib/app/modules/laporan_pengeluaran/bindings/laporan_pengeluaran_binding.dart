import 'package:get/get.dart';

import '../controllers/laporan_pengeluaran_controller.dart';

class LaporanPengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPengeluaranController>(
      () => LaporanPengeluaranController(),
    );
  }
}
