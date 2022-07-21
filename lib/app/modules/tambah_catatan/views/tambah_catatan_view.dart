import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/rounded_button_full_width_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';

import '../controllers/tambah_catatan_controller.dart';

class TambahCatatanView extends GetView<TambahCatatanController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
        appBar: AppBar(
          title: Text('TambahCatatanView'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            TextFormFieldComponent(
                controller: controller.tglCatatan,
                hintText: "Tanggal",
                readOnly: true,
                functionsValidator: (value) {
                  return GlobalValidator.validatorString(value);
                }),
            TextFormFieldComponent(
                controller: controller.judulCatatanCon,
                hintText: "Judul",
                functionsValidator: (value) {
                  return GlobalValidator.validatorString(value);
                }),
            TextFormFieldComponent(
                controller: controller.isiCatatanCon,
                hintText: "Isi",
                maxLines: 10,
                functionsValidator: (value) {
                  return GlobalValidator.validatorString(value);
                }),
            RoundedButtonFullWidthComponent(
                text: "Simpan", functionClick: controller.doTambahCatatan)
          ],
        ));
  }
}
