import 'package:get/get.dart';

import '../controllers/sliding_tab_laporan_controller.dart';

class SlidingTabLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlidingTabLaporanController>(
      () => SlidingTabLaporanController(),
    );
  }
}
