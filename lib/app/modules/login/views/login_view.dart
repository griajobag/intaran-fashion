import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/rounded_button_full_width_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TextComponent(
            text: 'Login',
            textColor: GlobalColor.primaryColor,
            textSize: MyTextSize.h5,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: GlobalColor.primaryColor),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                width: 120,
                height: 120,
                image: AssetImage("assets/intaran.png")),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 40, left: 10, right: 10),
              child: TextComponent(
                  textAlign: TextAlign.center,
                  text:
                      "Selamat data di aplikasi pencatatan transaksi Intaran Fashion. Silahkan login terlebih dahulu."),
            ),
            // TextFormFieldComponent(
            //     marginTop: 50,
            //     controller: controller.emailCon,
            //     hintText: 'Email',
            //     functionsValidator: (value) {
            //       return GlobalValidator.validatorString(value);
            //     }),
            // TextFormFieldComponent(
            //     controller: controller.passwordCon,
            //     hintText: 'Password',
            //     functionsValidator: (value) {
            //       return GlobalValidator.validatorString(value);
            //     }),
            RoundedButtonFullWidthComponent(
                imageUrl: 'assets/google.png',
                text: 'Login',
                color: GlobalColor.colorGoogle,
                functionClick: controller.doLoginGoogle)
          ],
        ));
  }
}
