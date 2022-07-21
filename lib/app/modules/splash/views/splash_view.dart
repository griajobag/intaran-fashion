import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2), () {
    //   Get.toNamed(Routes.LOGIN);
    // });
    controller.onInit();
    return const Scaffold(
      body: Center(
          child: Image(width: 200, image: AssetImage("assets/intaran.png"))),
    );
  }
}
