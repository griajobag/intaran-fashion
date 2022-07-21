import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/rounded_button_full_width_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';

import '../controllers/tambah_metode_pembayaran_controller.dart';

class TambahMetodePembayaranView
    extends GetView<TambahMetodePembayaranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah Metode'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextFormFieldComponent(
                controller: controller.namaMetodeCon,
                hintText: "Nama Metode",
                functionsValidator: (value) {
                  return GlobalValidator.validatorString(value);
                }),
            TextFormFieldComponent(
                controller: controller.nomerMetodeCon,
                hintText: "Nomer Metode",
                functionsValidator: (value) {
                  return GlobalValidator.validatorString(value);
                }),
            RoundedButtonFullWidthComponent(
                text: "Simpan", functionClick: controller.doTambahMetode)
          ],
        ));
  }
}
