import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/barang_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

class ListDataBarangController extends GetxController {
  var listBarang = List<BarangEntity>.empty(growable: true).obs;
  RxBool isLoading = true.obs;
  MasterBarangDataSource? masterPengeluaranDataSource =
      MasterBarangDataSource();
  final searchCon = TextFormFieldController();

  _getListMetodePembayaran() async {
    var lists = await FirebaseRepo.getListBarang();
    isLoading.value = false;
    listBarang.addAll(lists);
    masterPengeluaranDataSource!.addData(listBarang);
  }

  @override
  void onInit() {
    isLoading.value = true;
    _getListMetodePembayaran();
    masterPengeluaranDataSource!.setContext(Get.context!);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class MasterBarangDataSource extends DataTableSource {
  List<BarangEntity> _listData = [];
  late BuildContext context;
  void setContext(BuildContext newContext) {
    context = newContext;
  }

  void addData(List<BarangEntity> lists) {
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
              text: (_listData[index].namaBarang == null)
                  ? "null"
                  : _listData[index].namaBarang!)),
          DataCell(TextComponent(
              text: (_listData[index].stok == null)
                  ? "null"
                  : _listData[index].stok.toString())),
          DataCell(TextComponent(
              text: (_listData[index].hargaAwal == null)
                  ? "null"
                  : GlobalFunction.mataUang(_listData[index].hargaAwal!))),
          DataCell(TextComponent(
              text: (_listData[index].hargaJual == null)
                  ? "null"
                  : GlobalFunction.mataUang(_listData[index].hargaJual))),
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
                    functionOnTap: () {})
              ],
            ),
          )),
        ],
        index: index,
        color: (index % 2 == 0)
            ? MaterialStateColor.resolveWith((states) => Colors.grey[200]!)
            : MaterialStateColor.resolveWith((states) => Colors.grey[350]!));
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listData.length;

  @override
  int get selectedRowCount => _selectedCount;
}
