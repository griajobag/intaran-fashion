import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';

import '../controllers/list_transaksi_controller.dart';

class ListTransaksiView extends GetView<ListTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Transaksi'),
        ),
        body: Obx(
          () => (controller.isLoading.isTrue)
              ? GlobalFunction.showLoading()
              : (controller.listMetodePembayaran.isEmpty)
                  ? Container(
                      child: const TextComponent(text: "Tidak ada data"),
                    )
                  : SingleChildScrollView(
                      child: PaginatedDataTable(
                        header: _searchBox(),
                        rowsPerPage: 10,
                        source: controller.masterTransaksiDataSource!,
                        sortAscending: true,
                        columns: const [
                          DataColumn(
                              label: TextComponent(
                            text: "Tanggal",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Nama Pembeli",
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
                            text: "Harga Jual",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "QTY",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Metode Bayar",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Harga Total",
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
