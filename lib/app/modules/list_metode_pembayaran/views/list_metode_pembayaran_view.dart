import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';

import '../controllers/list_metode_pembayaran_controller.dart';

class ListMetodePembayaranView extends GetView<ListMetodePembayaranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Metode Pembayaran'),
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
                        source: controller.masterPaymentDataSource!,
                        sortAscending: true,
                        columns: const [
                          DataColumn(
                              label: TextComponent(
                            text: "Nama",
                            fontWeight: FontWeight.bold,
                            textColor: GlobalColor.colorBlack,
                          )),
                          DataColumn(
                              label: TextComponent(
                            text: "Nomer",
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
