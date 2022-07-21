import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/main_result_api_model.dart';
import 'package:intaranfashion_mobile/app/routes/app_pages.dart';
import 'package:intaranfashion_mobile/utils/datas/my_shared_.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 2), () {
      if (currentUser == null) {
        Get.toNamed(Routes.LOGIN);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    });
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
