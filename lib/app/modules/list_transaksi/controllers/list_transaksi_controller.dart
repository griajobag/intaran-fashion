import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_entity.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_from_firestore_entity.dart';
import 'package:intaranfashion_mobile/app/routes/app_pages.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

class ListTransaksiController extends GetxController {
  var listMetodePembayaran =
      List<TransaksiFromFirestoreEntity>.empty(growable: true).obs;
  RxBool isLoading = true.obs;
  MasterTransaksiDataSource? masterTransaksiDataSource =
      MasterTransaksiDataSource();
  final searchCon = TextFormFieldController();

  _getListTransaksi() async {
    isLoading.value = true;
    var lists = await FirebaseRepo.getListTransaksi();
    isLoading.value = false;
    listMetodePembayaran.addAll(lists);
    masterTransaksiDataSource!.addData(listMetodePembayaran);
    isLoading.value = false;
  }

  @override
  void onInit() {
    _getListTransaksi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class MasterTransaksiDataSource extends DataTableSource {
  List<TransaksiFromFirestoreEntity> _listData = [];
  late BuildContext context;
  void setContext(BuildContext newContext) {
    context = newContext;
  }

  void addData(List<TransaksiFromFirestoreEntity> lists) {
    _listData.addAll(lists);
    notifyListeners();
  }

  void clearData() {
    if (_listData.isNotEmpty) {
      _listData.clear();
      notifyListeners();
    }
  }

  final int _selectedCount = 0;
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(TextComponent(
              text: (_listData[index].tglTransaksi == null)
                  ? "null"
                  : MyDateFormat.dfTanggalBulanTahunPlusJam
                      .format(_listData[index].tglTransaksi!.toDate()))),
          DataCell(TextComponent(
              text: (_listData[index].namaPembeli == null)
                  ? "null"
                  : _listData[index].namaPembeli!)),
          DataCell(TextComponent(
              text: (_listData[index].listItem == null)
                  ? "null"
                  : _listData[index]
                      .listItem!
                      .map((e) => e.barang!.namaBarang)
                      .toList()
                      .toString())),
          DataCell(TextComponent(
              text: (_listData[index].listItem == null)
                  ? "null"
                  : _listData[index]
                      .listItem!
                      .map((e) => GlobalFunction.mataUang(e.barang!.hargaJual))
                      .toList()
                      .toString())),
          DataCell(TextComponent(
              text: (_listData[index].listItem == null)
                  ? "null"
                  : _listData[index]
                      .listItem!
                      .map((e) => e.qty!.toInt())
                      .toList()
                      .toString())),
          DataCell(TextComponent(
              text: (_listData[index].listItem == null)
                  ? "null"
                  : _listData[index].namaMetodePembayaran!)),
          DataCell(TextComponent(
              text: (_listData[index].listItem == null)
                  ? "null"
                  : totalHarga(_listData[index].listItem!))),
          DataCell(Container(
            child: Row(
              children: [
                TextInkwellComponent(
                    text: "Edit".toUpperCase(),
                    color: GlobalColor.colorBlue,
                    functionOnTap: () {}),
                TextInkwellComponent(
                    text: "Delete".toUpperCase(),
                    color: GlobalColor.colorRed,
                    functionOnTap: () {}),
                TextInkwellComponent(
                    text: "Detail".toUpperCase(),
                    color: GlobalColor.colorBlue,
                    functionOnTap: () {
                      Get.toNamed(Routes.DETAIL_TRANSAKSI,
                          arguments: {"items": _listData[index].toJson()});
                    })
              ],
            ),
          )),
        ],
        index: index,
        color: (index % 2 == 0)
            ? MaterialStateColor.resolveWith((states) => Colors.grey[200]!)
            : MaterialStateColor.resolveWith((states) => Colors.grey[350]!));
  }

  String totalHarga(List<BarangDibeliEntity> list) {
    double hargaTotal = 0.0;
    for (var element in list) {
      hargaTotal += element.qty! * element.barang!.hargaJual!;
    }
    return GlobalFunction.mataUang(hargaTotal);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listData.length;

  @override
  int get selectedRowCount => _selectedCount;
}
