import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

class ListMetodePembayaranController extends GetxController {
  var listMetodePembayaran =
      List<MetodePembayaranEntity>.empty(growable: true).obs;
  RxBool isLoading = true.obs;
  MasterPaymentDataSource? masterPaymentDataSource = MasterPaymentDataSource();
  final searchCon = TextFormFieldController();

  _getListMetodePembayaran() async {
    var lists = await FirebaseRepo.getListMetodePembayaran();
    isLoading.value = false;
    listMetodePembayaran.addAll(lists!);
    masterPaymentDataSource!.addData(listMetodePembayaran);
  }

  @override
  void onInit() {
    isLoading.value = true;
    _getListMetodePembayaran();
    masterPaymentDataSource!.setContext(Get.context!);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class MasterPaymentDataSource extends DataTableSource {
  List<MetodePembayaranEntity> _listData = [];
  late BuildContext context;
  void setContext(BuildContext newContext) {
    context = newContext;
  }

  void addData(List<MetodePembayaranEntity> lists) {
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
              text: (_listData[index].namaMetode == null)
                  ? "null"
                  : _listData[index].namaMetode!)),
          DataCell(TextComponent(
              text: (_listData[index].nomerMetode == null)
                  ? "null"
                  : _listData[index].nomerMetode!)),
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
