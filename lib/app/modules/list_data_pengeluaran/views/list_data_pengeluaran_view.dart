import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/table_horizontal_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';
import 'package:intl/intl.dart';

import '../controllers/list_data_pengeluaran_controller.dart';

class ListDataPengeluaranView extends GetView<ListDataPengeluaranController> {
  const ListDataPengeluaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Pengeluaran'),
          centerTitle: true,
        ),
        body: Obx(
          () => (controller.isLoading.isTrue)
              ? GlobalFunction.showLoading()
              : (controller.listPengeluaran.isEmpty)
                  ? Container(
                      child: const TextComponent(text: "Tidak ada data"),
                    )
                  : SingleChildScrollView(
                      child: PaginatedDataTable(
                        header: _searchBox(),
                        rowsPerPage: 10,
                        source: controller.masterPengeluaranDataSource!,
                        sortAscending: true,
                        columns: const [
                          DataColumn(
                              label: TextComponent(
                            text: "TGL Pengeluaran",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Nama Barang",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Metode Pembayaran",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Satuan",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Jumlah",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Harga Per Satuan",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Total",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Action",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                        ],
                      ),
                    ),
        ));
  }

  Widget _searchBox() {
    return Row(
      children: [
        Expanded(
          child: TextFormFieldComponent(
              marginLeft: 0,
              isCustomDerationEnable: false,
              controller: controller.searchCon,
              hintText: "Cari",
              functionsValidator: (value) {
                return GlobalValidator.validatorString(value);
              }),
        ),
        TextInkwellComponent(
            text: "Cari", color: GlobalColor.primaryColor, functionOnTap: () {})
      ],
    );
  }
}
