import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/barang_entity.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_alert.dart';

class TambahTransaksiController extends GetxController {
  final tglTransaksi = TextFormFieldController(required: true);
  final qtyCon = TextFormFieldController(required: true);
  final hargaCon = TextFormFieldController(required: true);
  final namaPembeliCon = TextFormFieldController(required: true);
  final alamatCon = TextFormFieldController(required: true);
  BarangEntity? barangEntitySelected;
  List<BarangEntity>? listBrangEntity =
      List.empty(growable: true); //load barang dari server
  RxBool isLoadingGetBarang = true.obs;
  List<BarangDibeliEntity>? listBarangDipilih =
      List<BarangDibeliEntity>.empty(growable: true)
          .obs; // list barang yang ditambahkan
  DateTime? tglTransaksiSelected = DateTime.now();
  double totalYangHarusDibayarkan = 0.0;
  double modalYangDikeluarkan = 0.0;
  RxBool isLoadingMetode = true.obs;

  List<MetodePembayaranEntity> listMetodePembayaran =
      List<MetodePembayaranEntity>.empty(growable: true);
  MetodePembayaranEntity? metodePembayaranEntitySelected;

  bool _isValid() {
    if (tglTransaksiSelected == null) {
      GlobalAlert.standartDialog("Tanggal transaksi harus dipilih.");
      return false;
    }
    if (listBarangDipilih!.isEmpty) {
      GlobalAlert.standartDialog("Barang harus ditambahkan terlebih dahulu");
      return false;
    }
    if (!namaPembeliCon.key.currentState!.validate()) return false;
    if (!alamatCon.key.currentState!.validate()) return false;
    if (metodePembayaranEntitySelected == null) {
      GlobalAlert.standartDialog("Metode pembayaran harus dipilih");
      return false;
    }
    return true;
  }

  Future<Function()?> doSimpanTransaksi() async {
    if (_isValid()) {
      try {
        GlobalAlert.konfirmasiDialog("Pastikan data sudah benar. Lanjutkan?",
            () async {
          Get.back();
          EasyLoading.show();
          await FirebaseRepo.tambahTransaksi(TransaksiEntity(
              alamatPembeli: alamatCon.con.text,
              idMetodePembayaran: metodePembayaranEntitySelected!.id,
              listItem: FieldValue.arrayUnion(
                  json.decode(jsonEncode(listBarangDipilih))),
              namaMetodePembayaran: metodePembayaranEntitySelected!.namaMetode,
              namaPembeli: namaPembeliCon.con.text,
              total: totalYangHarusDibayarkan,
              modal: modalYangDikeluarkan,
              tglTransaksi: Timestamp.fromDate(tglTransaksiSelected!)));
          EasyLoading.dismiss();
          GlobalAlert.standartDialog(
            "Data transaksi berhasil ditambahkan",
            onConfim: () {
              Get.back();
              Get.back();
            },
          );
        });
      } catch (e) {
        EasyLoading.dismiss();
        GlobalAlert.standartDialog(e.toString());
      }
    }
  }

  void _clearAll() {
    barangEntitySelected = null;
    qtyCon.con.clear();
    hargaCon.con.clear();
  }

  void _getMetodePembayaran() async {
    var data = await FirebaseRepo.getListMetodePembayaran();
    listMetodePembayaran.addAll(data!);
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
      tglTransaksiSelected = dates;
      tglTransaksi.con.text =
          MyDateFormat.dfTanggalBulanTahun.format(tglTransaksiSelected!);
    }
  }

  void setBarangDibeli() {
    listBarangDipilih!.add(BarangDibeliEntity(
        qty: double.parse(qtyCon.con.text), barang: barangEntitySelected));

    totalYangHarusDibayarkan +=
        barangEntitySelected!.hargaJual! * int.parse(qtyCon.con.text);
    modalYangDikeluarkan +=
        barangEntitySelected!.hargaAwal! * int.parse(qtyCon.con.text);
    _clearAll();
  }

  void removeBarangDibeli(int index) {
    var hargaDikurangi = listBarangDipilih![index].barang!.hargaJual! *
        int.parse(qtyCon.con.text);

    var hargaDikurangiModal = listBarangDipilih![index].barang!.hargaAwal! *
        int.parse(qtyCon.con.text);

    totalYangHarusDibayarkan = totalYangHarusDibayarkan - hargaDikurangi;

    modalYangDikeluarkan =
        modalYangDikeluarkan = modalYangDikeluarkan - hargaDikurangiModal;
  }

  _getListBarang() async {
    var lists = await FirebaseRepo.getListBarang();
    isLoadingGetBarang.value = false;
    listBrangEntity!.addAll(lists);
  }

  bool _isValidTambahkanBarang() {
    if (!qtyCon.key.currentState!.validate()) return false;
    return true;
  }

  Future<Function()>? validationTambahkan() {
    if (barangEntitySelected == null) {
      GlobalAlert.standartDialog("Barang harus dipilih terlebih dahulu");
    } else {
      if (_isValidTambahkanBarang()) {
        setBarangDibeli();
      }
    }
  }

  @override
  void onInit() {
    _getMetodePembayaran();

    tglTransaksi.con.text =
        MyDateFormat.dfTanggalBulanTahunPlusJam.format(DateTime.now());

    _getListBarang();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
