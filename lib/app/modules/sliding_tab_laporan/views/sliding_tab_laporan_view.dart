import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/modules/laporan_pemasukan/views/laporan_pemasukan_view.dart';
import 'package:intaranfashion_mobile/app/modules/laporan_pengeluaran/views/laporan_pengeluaran_view.dart';

import '../controllers/sliding_tab_laporan_controller.dart';

class SlidingTabLaporanView extends GetView<SlidingTabLaporanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan"),
        bottom: TabBar(
          tabs: controller.slidingTab,
          controller: controller.tabController,
        ),
      ),
      body: TabBarView(
          children: const [LaporanPemasukanView(), LaporanPengeluaranView()],
          controller: controller.tabController),
    );
  }
}
