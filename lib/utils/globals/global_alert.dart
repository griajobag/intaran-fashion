import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/container_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

class GlobalAlert {
  static void konfirmasiDialog(String message, Function() onConfirm,
      {String title = "Konfirmasi",
      double textSize = MyTextSize.normal,
      Color textColor = GlobalColor.colorBlack}) {
    Get.defaultDialog(
        title: title,
        middleText: message,
        middleTextStyle: TextStyle(fontSize: textSize, color: textColor),
        onCancel: () {},
        onConfirm: onConfirm);
  }

  static void standartDialog(String message,
      {String title = "Info",
      double textSize = MyTextSize.normal,
      Color textColor = GlobalColor.colorBlack,
      Function()? onConfim}) {
    Get.defaultDialog(
        title: title,
        middleText: message,
        middleTextStyle: TextStyle(fontSize: textSize, color: textColor),
        onConfirm: onConfim);
  }

  static openBottomSheetList(List<Widget> widgets,
      {String type = "close", Function()? onTapSubmit}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: Get.context!,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: type == "close"
                ? const ContainerComponent(
                    padding: 10,
                    child: TextComponent(
                      text: "Close",
                      textAlign: TextAlign.center,
                    ))
                : InkWell(
                    onTap: onTapSubmit,
                    child: const ContainerComponent(
                        padding: 10,
                        child: TextComponent(
                            textAlign: TextAlign.center, text: "Submit"))),
          )
        ],
      ),
    );
  }
}
