import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/rounded_button_full_width_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';
import 'package:intaranfashion_mobile/utils/others/number_format_textfield.dart';

import '../controllers/tambah_barang_controller.dart';

class TambahBarangView extends GetView<TambahBarangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Barang'),
        ),
        body: Container(
          child: Column(
            children: [
              TextFormFieldComponent(
                  controller: controller.namaBarangCon,
                  hintText: "Nama barang",
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              TextFormFieldComponent(
                  controller: controller.stokBarangCon,
                  hintText: "Stok",
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
              TextFormFieldComponent(
                  controller: controller.hargaAwalCon,
                  hintText: "Harga awal",
                  textInputType: InputTypeField.number,
                  listFormatter: [NumericTextFormatter()],
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              TextFormFieldComponent(
                  controller: controller.hargaJualCon,
                  textInputType: InputTypeField.number,
                  listFormatter: [NumericTextFormatter()],
                  hintText: "Harga jual",
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              RoundedButtonFullWidthComponent(
                  text: "Simpan", functionClick: controller.doTambahBarang)
            ],
          ),
        ));
  }
}
