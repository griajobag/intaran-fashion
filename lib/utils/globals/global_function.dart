import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intl/intl.dart';

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

class GlobalFunction {
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = GlobalColor.primaryColor
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = GlobalColor.primaryGrey.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = true
      ..customAnimation = CustomAnimation();
  }

  static Widget showLoading() {
    return Container(
      alignment: Alignment.center,
      child: (kIsWeb)
          ? const Padding(
              padding: EdgeInsets.all(12.0),
              child: CupertinoActivityIndicator(),
            )
          : (Platform.isIOS)
              ? const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CupertinoActivityIndicator(),
                )
              : const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ),
    );
  }

  static bool isTablet(BuildContext context) {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? false : true;
  }

  static double childAspekRasioKalender(BuildContext context) {
    if (kIsWeb) {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return 1;
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        return 0.9;
      } else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
        return 0.8;
      } else if (defaultTargetPlatform == TargetPlatform.linux) {
        return 1.8;
      } else if (defaultTargetPlatform == TargetPlatform.macOS) {
        return 1.8;
      } else if (defaultTargetPlatform == TargetPlatform.windows) {
        return 1.8;
      } else {
        return 1.8;
      }
    } else {
      if (Platform.isIOS) {
        return 1;
      } else {
        return 0.9;
      }
    }
  }

  static String mataUang(dynamic nominal) {
    return NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: "Rp")
        .format(nominal);
  }

  static dynamic openDateTimePicker(
      {InputTypeField type = InputTypeField.date}) async {
    dynamic value;
    if (type == InputTypeField.date) {
      await showDatePicker(
              context: Get.context!,
              initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime.now())
          .then((dates) => {value = dates});
    } else {
      await showTimePicker(
              context: Get.context!,
              initialTime: const TimeOfDay(hour: 12, minute: 00))
          .then((times) => value = times);
    }
    return value;
  }
}
