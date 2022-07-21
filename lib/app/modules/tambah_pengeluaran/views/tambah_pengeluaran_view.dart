import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/utils/components/drop_down_component.dart';
import 'package:intaranfashion_mobile/utils/components/rounded_button_full_width_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';
import 'package:intaranfashion_mobile/utils/others/number_format_textfield.dart';

import '../controllers/tambah_pengeluaran_controller.dart';

class TambahPengeluaranView extends GetView<TambahPengeluaranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Pengeluaran'),
          centerTitle: true,
        ),
        body: Obx(
          () => ListView(
            children: [
              TextFormFieldComponent(
                  controller: controller.tglPengeluaranCon,
                  hintText: "Tanggal pengeluaran",
                  readOnly: true,
                  functionOnTap: controller.openDatePicker,
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              TextFormFieldComponent(
                  controller: controller.namaBarangCon,
                  hintText: "Nama barang",
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              TextFormFieldComponent(
                  controller: controller.jumlahCon,
                  hintText: "Jumlah",
                  textInputType: InputTypeField.number,
                  listFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        final text = newValue.text;
                        if (text.isNotEmpty) double.parse(text);
                        return newValue;
                      } catch (e) {}
                      return oldValue;
                    }),
                  ],
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              DropDownComponent<String>(
                  labelText: "Satuan (cth : meter, buah, biji, dll)",
                  objectSelected: controller.valueSatuanSelected.value,
                  listObject: const [
                    "Meter",
                    "Bungkus",
                    "Biji",
                    "Buah",
                    "KG",
                    "Lainnya"
                  ],
                  valueObjectAsLabel: (e) => e,
                  onChangeValue: (value) {
                    controller.valueSatuanSelected.value = value;
                  }),
              TextFormFieldComponent(
                  controller: controller.hargaPerSatuan,
                  hintText: "Harga per satuan",
                  textInputType: InputTypeField.number,
                  listFormatter: [NumericTextFormatter()],
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              controller.isLoadingMetode.value
                  ? GlobalFunction.showLoading()
                  : DropDownComponent<MetodePembayaranEntity>(
                      labelText: "Metode pembayaran",
                      objectSelected:
                          controller.metodePembayaranEntitySelected!,
                      listObject: controller.listMetodePembayaran,
                      valueObjectAsLabel: (e) => e.namaMetode!,
                      onChangeValue: (value) {
                        controller.metodePembayaranEntitySelected = value;
                      }),
              RoundedButtonFullWidthComponent(
                  text: "Simpan", functionClick: controller.doTambahPengeluaran)
            ],
          ),
        ));
  }
}
