import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/app/models/pengeluaran_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_alert.dart';

class TambahPengeluaranController extends GetxController {
  final tglPengeluaranCon = TextFormFieldController(required: true);
  final namaBarangCon = TextFormFieldController(required: true);
  final jumlahCon = TextFormFieldController(required: true);
  final satuanCon = TextFormFieldController(required: true);
  final hargaPerSatuan = TextFormFieldController(required: true);
  final listMetodePembayaran =
      List<MetodePembayaranEntity>.empty(growable: true).obs;
  MetodePembayaranEntity? metodePembayaranEntitySelected;
  RxBool isLoadingMetode = true.obs;
  RxString valueSatuanSelected = "Meter".obs;
  DateTime? tglPengeluaranSelected = DateTime.now();

  bool _isValid() {
    if (!tglPengeluaranCon.key.currentState!.validate()) return false;
    if (!namaBarangCon.key.currentState!.validate()) return false;
    if (!jumlahCon.key.currentState!.validate()) return false;
    if (!hargaPerSatuan.key.currentState!.validate()) return false;
    return true;
  }

  Future<Function()?> doTambahPengeluaran() async {
    if (_isValid()) {
      try {
        EasyLoading.show();
        await FirebaseRepo.tambahPengeluaran(PengeluaranEntity(
          hargaPerSatuan:
              double.parse(hargaPerSatuan.con.text.replaceAll(",", "")),
          idMetodePembayaran: metodePembayaranEntitySelected!.id,
          jumlah: double.parse(jumlahCon.con.text),
          namaBarang: namaBarangCon.con.text,
          namaMetodePembayaran: metodePembayaranEntitySelected!.namaMetode,
          satuan: valueSatuanSelected.value,
          tglPengeluaran: Timestamp.fromDate(tglPengeluaranSelected!),
        ));
        EasyLoading.dismiss().then((value) => GlobalAlert.standartDialog(
            "Data pengeluaran berhasil ditambahkan"));
      } catch (e) {
        EasyLoading.dismiss()
            .then((value) => GlobalAlert.standartDialog(e.toString()));
      }
    }
  }

  void _getMetodePembayaran() async {
    var data = await FirebaseRepo.getListMetodePembayaran();
    listMetodePembayaran.addAll(data!);
    metodePembayaranEntitySelected = listMetodePembayaran[0];
    isLoadingMetode.value = false;
  }

  Future<Function()?> openDatePicker() async {
    var dates = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 01, 01),
      lastDate: DateTime(2100, 01, 01),
    );

    if (dates != null) {
      tglPengeluaranSelected = dates;
      tglPengeluaranCon.con.text =
          MyDateFormat.dfTanggalBulanTahun.format(tglPengeluaranSelected!);
    }
  }

  @override
  void onInit() {
    _getMetodePembayaran();
    tglPengeluaranCon.con.text =
        MyDateFormat.dfTanggalBulanTahun.format(tglPengeluaranSelected!);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
