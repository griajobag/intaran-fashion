import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/globals/global_alert.dart';

class TambahMetodePembayaranController extends GetxController {
  final count = 0.obs;

  final namaMetodeCon = TextFormFieldController(required: true);
  final nomerMetodeCon = TextFormFieldController(required: true);

  bool _isValid() {
    if (!namaMetodeCon.key.currentState!.validate()) return false;
    if (!nomerMetodeCon.key.currentState!.validate()) return false;
    return true;
  }

  Future<Function()?> doTambahMetode() async {
    if (_isValid()) {
      try {
        EasyLoading.show();
        await FirebaseRepo.tambahMetodePembayaran(
            namaMetodeCon.con.text, nomerMetodeCon.con.text);
        EasyLoading.dismiss().then((value) => GlobalAlert.standartDialog(
            "Metode pembayaran baru berhasil ditambahkan"));
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
  void increment() => count.value++;
}
