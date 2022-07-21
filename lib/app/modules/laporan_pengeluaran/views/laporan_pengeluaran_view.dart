import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_pengeluaran_controller.dart';

class LaporanPengeluaranView extends GetView<LaporanPengeluaranController> {
  const LaporanPengeluaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'LaporanPengeluaranView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
