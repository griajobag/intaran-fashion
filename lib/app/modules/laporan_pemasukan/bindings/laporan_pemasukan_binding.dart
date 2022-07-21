import 'package:get/get.dart';

import '../controllers/laporan_pemasukan_controller.dart';

class LaporanPemasukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPemasukanController>(
      () => LaporanPemasukanController(),
    );
  }
}
