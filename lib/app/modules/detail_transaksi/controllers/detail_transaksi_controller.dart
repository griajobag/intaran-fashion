import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_entity.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_from_firestore_entity.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

class DetailTransaksiController extends GetxController {
  TransaksiFromFirestoreEntity transaksiFromFirestoreEntity =
      TransaksiFromFirestoreEntity.fromJson(Get.arguments['items']);

  String totalHarga() {
    double hargaTotal = 0.0;
    for (var element in transaksiFromFirestoreEntity.listItem!) {
      hargaTotal += element.qty! * element.barang!.hargaJual!;
    }
    return GlobalFunction.mataUang(hargaTotal);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
