import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/pengeluaran_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

class ListDataPengeluaranController extends GetxController {
  //TODO: Implement ListDataPengeluaranController

  var listPengeluaran = List<PengeluaranEntity>.empty(growable: true).obs;
  RxBool isLoading = true.obs;
  MasterPengeluaranDataSource? masterPengeluaranDataSource =
      MasterPengeluaranDataSource();
  final searchCon = TextFormFieldController();

  _getListPengeluaran() async {
    var lists = await FirebaseRepo.getListPengeluaran();
    isLoading.value = false;
    listPengeluaran.addAll(lists);
    masterPengeluaranDataSource!.addData(listPengeluaran);
  }

  @override
  void onInit() {
    isLoading.value = true;
    _getListPengeluaran();
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

class MasterPengeluaranDataSource extends DataTableSource {
  List<PengeluaranEntity> _listData = [];
  late BuildContext context;
  void setContext(BuildContext newContext) {
    context = newContext;
  }

  void addData(List<PengeluaranEntity> lists) {
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
              text: (_listData[index].tglPengeluaran == null)
                  ? "null"
                  : MyDateFormat.dfTanggalBulanTahunPlusJam
                      .format(_listData[index].tglPengeluaran!.toDate()))),
          DataCell(TextComponent(
              text: (_listData[index].namaBarang == null)
                  ? "null"
                  : _listData[index].namaBarang!)),
          DataCell(TextComponent(
              text: (_listData[index].namaMetodePembayaran == null)
                  ? "null"
                  : _listData[index].namaMetodePembayaran!)),
          DataCell(TextComponent(
              text: (_listData[index].satuan == null)
                  ? "null"
                  : _listData[index].satuan!.toString())),
          DataCell(TextComponent(
              text: (_listData[index].jumlah == null)
                  ? "null"
                  : _listData[index].jumlah!.toString())),
          DataCell(TextComponent(
              text: (_listData[index].hargaPerSatuan == null)
                  ? "null"
                  : GlobalFunction.mataUang(_listData[index].hargaPerSatuan!))),
          DataCell(TextComponent(
              text: (_listData[index].hargaPerSatuan == null)
                  ? "null"
                  : GlobalFunction.mataUang(_listData[index].hargaPerSatuan! *
                      _listData[index].jumlah!))),
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
