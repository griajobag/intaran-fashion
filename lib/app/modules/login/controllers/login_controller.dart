import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/main_result_api_model.dart';
import 'package:intaranfashion_mobile/app/models/user_model.dart';
import 'package:intaranfashion_mobile/app/routes/app_pages.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/datas/Api.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';
import 'package:intaranfashion_mobile/utils/datas/my_shared_.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';

class LoginController extends GetxController {
  final controller = TextFormFieldController();
  final emailCon = TextFormFieldController(required: true);
  final passwordCon = TextFormFieldController(required: true);

  bool isValid() {
    if (!emailCon.key.currentState!.validate()) return false;
    if (!passwordCon.key.currentState!.validate()) return false;
    return true;
  }

  Future<Function()?> doLoginGoogle() async {
    try {
      EasyLoading.show();
      var user = await FirebaseRepo.signInWithGoogle();
      if (!user.isBlank!) {
        EasyLoading.dismiss();
        Get.defaultDialog(
            title: "Sukses",
            middleText: "Login berhasil dilakukan.",
            onConfirm: () {
              Get.toNamed(Routes.HOME);
            });
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: "Info",
        middleText: e.toString(),
      );
    }
  }

  Future<Function()?> doLogin() async {
    if (isValid()) {
      try {
        EasyLoading.show();
        MainApiResultModel? resultModel =
            await Api.apiPost("api/user/login", formData: {
          "email": emailCon.con.text,
          "password": passwordCon.con.text,
        });
        if (!resultModel.isBlank!) {
          if (resultModel.status == false) {
            EasyLoading.dismiss();
            Get.defaultDialog(
              title: "Info",
              middleText: resultModel.message!,
            );
          } else {
            EasyLoading.dismiss().then((value) {
              MySharedPreference.setLoginUserToLocal(resultModel);
              Get.toNamed(Routes.HOME);
            });
          }
        } else {
          EasyLoading.dismiss();
          Get.defaultDialog(
            title: "Info",
            middleText: "Terjadi kesalahan",
          );
        }
      } catch (e) {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: "Info",
          middleText: e.toString(),
        );
      }
    }
  }

  Future<Function()?> getSingleUser() async {
    if (isValid()) {
      try {
        EasyLoading.show();
        MainApiResultModel response = await Api.apiGet("api/user/single?id=1");
        UserModel userModel = UserModel.fromJson(response.data!);
        if (!response.isBlank!) {
          EasyLoading.dismiss();
        }
      } catch (e) {
        EasyLoading.dismiss();
        throw Exception(e);
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
