import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/catatan_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_alert.dart';

class TambahCatatanController extends GetxController {
  final tglCatatan = TextFormFieldController(required: true);
  final judulCatatanCon = TextFormFieldController(required: true);
  final isiCatatanCon = TextFormFieldController(required: true);
  DateTime? dateCatatan = DateTime.now();

  Future<Function()?> openDatePicker() async {
    var dates = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 01, 01),
      lastDate: DateTime(2100, 01, 01),
    );

    if (dates != null) {
      dateCatatan = dates;
      tglCatatan.con.text =
          MyDateFormat.dfTanggalBulanTahun.format(dateCatatan!);
    }
  }

  bool _isValid() {
    if (!tglCatatan.key.currentState!.validate()) return false;
    if (!judulCatatanCon.key.currentState!.validate()) return false;
    if (!isiCatatanCon.key.currentState!.validate()) return false;
    return true;
  }

  Future<Function()?> doTambahCatatan() async {
    try {
      if (_isValid()) {
        EasyLoading.show();
        await FirebaseRepo.tambahCatatan(CatatanEntity(
            isi: isiCatatanCon.con.text,
            judul: judulCatatanCon.con.text,
            tglCatatan: Timestamp.fromDate(dateCatatan!)));
        EasyLoading.dismiss();
        GlobalAlert.standartDialog("Catatan berhasil ditambahkan",
            onConfim: () {
          Get.back();
          Get.back();
        });
      }
    } catch (e) {
      EasyLoading.dismiss();
      GlobalAlert.standartDialog(e.toString());
    }
  }

  @override
  void onInit() {
    tglCatatan.con.text =
        MyDateFormat.dfTanggalBulanTahunPlusJam.format(dateCatatan!);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
