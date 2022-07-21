import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/laporan_pemasukan_model.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_entity.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_from_firestore_entity.dart';
import 'package:intaranfashion_mobile/utils/components/drop_down_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/global_alert.dart';

class TotalUangDiTiapMetode {
  String? namaMetode;
  double? total;
  TotalUangDiTiapMetode({this.namaMetode, this.total});
}

class BulanModel {
  int? bulan;
  String? namaBulan;
  BulanModel({this.bulan, this.namaBulan});
}

class LaporanPemasukanController extends GetxController {
  List<TransaksiFromFirestoreEntity> listTransaksi = List.empty(growable: true);
  List<LaporanPemasukanModel> listLaporanPemasukan = List.empty(growable: true);
  List<BarangDibeliEntity> listBarangDiBeli = List.empty(growable: true);
  RxList<TotalUangDiTiapMetode> listTotalUangPerMetode =
      List<TotalUangDiTiapMetode>.empty(growable: true).obs;
  double modelPerPeriode = 0.0;
  RxBool isLoadingGetData = true.obs;
  RxDouble totalModal = 0.0.obs;
  RxDouble totalOmset = 0.0.obs;
  RxDouble totalLabaBersih = 0.0.obs;

  List<MetodePembayaranEntity> listMetodePembayaran =
      List.empty(growable: true);
  RxBool isLoadingMetodePembyaran = true.obs;
  MetodePembayaranEntity? metodePembayaranEntitySelected;
  dynamic tanggalSelected;

  final tanggalCon = TextFormFieldController(required: true);
  final metodePembayaran = TextFormFieldController(required: true);
  List<BulanModel> listBulan = List.empty(growable: true);
  BulanModel? bulanSelected;

  void _getTransaksi() async {
    isLoadingGetData.value = true;
    var data = await FirebaseRepo.getListTransaksi();
    isLoadingGetData.value = false;
    listTransaksi.addAll(data);

    if (listTransaksi.isNotEmpty) {
      for (var element in listTransaksi) {
        listBarangDiBeli.addAll(element.listItem!);
        totalModal.value = totalModal.value + element.modal!;
        totalOmset.value = totalOmset.value + element.total!;
        for (var barang in element.listItem!) {
          listLaporanPemasukan.add(LaporanPemasukanModel(
              barang: barang,
              idMetode: element.idMetodePembayaran,
              namaMetode: element.namaMetodePembayaran,
              qty: barang.qty,
              total: element.total,
              modal: element.modal,
              tglTransaksi: element.tglTransaksi));
        }
      }

      totalLabaBersih.value = totalOmset.value - totalModal.value;
    }
    _getMetodePembayaran();
  }

  void _getMetodePembayaran() async {
    isLoadingMetodePembyaran.value = true;
    var lists = await FirebaseRepo.getListMetodePembayaran();
    listMetodePembayaran.addAll(lists!);
    isLoadingMetodePembyaran.value = false;
    for (var e in listMetodePembayaran) {
      double totalUangPerMetode = 0.0;
      for (var element in listTransaksi) {
        if (!e.id.toString().contains(element.idMetodePembayaran.toString())) {
          continue;
        }
        totalUangPerMetode = element.total!;
      }
      listTotalUangPerMetode.add(TotalUangDiTiapMetode(
          namaMetode: e.namaMetode, total: totalUangPerMetode));
    }
  }

  void onTapFilter() {
    GlobalAlert.openBottomSheetList([
      DropDownComponent<BulanModel>(
          labelText: "Bulan",
          objectSelected: bulanSelected,
          listObject: listBulan,
          valueObjectAsLabel: (e) => e.namaBulan!,
          onChangeValue: (value) {
            bulanSelected = value;
          }),
      DropDownComponent<MetodePembayaranEntity>(
          labelText: "Metode Pembayaran",
          objectSelected: metodePembayaranEntitySelected,
          listObject: listMetodePembayaran,
          valueObjectAsLabel: (e) => e.namaMetode!,
          onChangeValue: (value) {
            metodePembayaranEntitySelected = value;
          }),
    ], type: "submit", onTapSubmit: () {});
  }

  @override
  void onInit() {
    listBulan.add(BulanModel(bulan: 1, namaBulan: "Januari"));
    listBulan.add(BulanModel(bulan: 2, namaBulan: "Februari"));
    listBulan.add(BulanModel(bulan: 3, namaBulan: "Maret"));
    listBulan.add(BulanModel(bulan: 4, namaBulan: "April"));
    listBulan.add(BulanModel(bulan: 5, namaBulan: "Mei"));
    listBulan.add(BulanModel(bulan: 6, namaBulan: "Juni"));
    listBulan.add(BulanModel(bulan: 7, namaBulan: "Juli"));
    listBulan.add(BulanModel(bulan: 8, namaBulan: "Agustus"));
    listBulan.add(BulanModel(bulan: 9, namaBulan: "September"));
    listBulan.add(BulanModel(bulan: 10, namaBulan: "Oktober"));
    listBulan.add(BulanModel(bulan: 11, namaBulan: "November"));
    listBulan.add(BulanModel(bulan: 12, namaBulan: "Desember"));
    _getTransaksi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
