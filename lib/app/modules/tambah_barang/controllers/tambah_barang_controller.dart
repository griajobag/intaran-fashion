import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/barang_entity.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/global_alert.dart';

class TambahBarangController extends GetxController {
  //TODO: Implement TambahBarangController

  final namaBarangCon = TextFormFieldController(required: true);
  final stokBarangCon = TextFormFieldController(required: true);
  final hargaAwalCon = TextFormFieldController(required: true);
  final hargaJualCon = TextFormFieldController(required: true);

  bool _isValid() {
    if (!namaBarangCon.key.currentState!.validate()) return false;
    if (!stokBarangCon.key.currentState!.validate()) return false;
    if (!hargaAwalCon.key.currentState!.validate()) return false;
    if (!hargaJualCon.key.currentState!.validate()) return false;
    return true;
  }

  Future<Function()?> doTambahBarang() async {
    if (_isValid()) {
      try {
        EasyLoading.show();
        await FirebaseRepo.tambaBarang(BarangEntity(
            hargaAwal: double.parse(hargaAwalCon.con.text.replaceAll(",", "")),
            hargaJual: double.parse(hargaJualCon.con.text.replaceAll(",", "")),
            namaBarang: namaBarangCon.con.text,
            stok: double.parse(stokBarangCon.con.text)));
        EasyLoading.dismiss().then((value) =>
            GlobalAlert.standartDialog("Stok barang berhasil ditambahkan"));
      } catch (e) {
        EasyLoading.dismiss()
            .then((value) => GlobalAlert.standartDialog(e.toString()));
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
