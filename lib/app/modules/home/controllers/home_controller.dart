import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/routes/app_pages.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_alert.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  Future<Function()?> doLogout() async {
    GlobalAlert.konfirmasiDialog("Apakah yakin akan keluar aplikasi?",
        () async {
      await FirebaseAuth.instance.signOut();
      GlobalAlert.standartDialog(
          "Logout Berhasil. Semua menu tidak bisa diakses jika belum login.",
          onConfim: () {
        Get.offAllNamed(Routes.LOGIN);
      });
    });
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
