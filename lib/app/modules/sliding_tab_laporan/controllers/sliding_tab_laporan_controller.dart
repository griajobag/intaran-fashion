import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlidingTabLaporanController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  final List<Tab> slidingTab = [
    Tab(
      text: "Pemasukan".toUpperCase(),
    ),
    Tab(
      text: "Pengeluaran".toUpperCase(),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: slidingTab.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }
}
