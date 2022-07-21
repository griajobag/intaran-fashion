import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/routes/app_pages.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

import '../controllers/list_catatan_controller.dart';

class ListCatatanView extends GetView<ListCatatanController> {
  const ListCatatanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catatan'),
          actions: [
            IconButton(
                onPressed: () async {
                  await Get.toNamed(
                    Routes.TAMBAH_CATATAN,
                  );
                  controller.onInit();
                },
                icon: const Icon(Icons.note_add))
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? GlobalFunction.showLoading()
              : controller.listCatatan.isEmpty
                  ? Container(
                      child: const TextComponent(text: "Tidak ada catatan"),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: TextComponent(
                                      textSize: MyTextSize.small,
                                      text: MyDateFormat
                                          .dfTanggalBulanTahunPlusJam
                                          .format(controller
                                              .listCatatan[index].tglCatatan!
                                              .toDate())),
                                ),
                                TextComponent(
                                  text: controller.listCatatan[index].judul!,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextComponent(
                                    marginTop: 10,
                                    text: controller.listCatatan[index].isi!)
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.listCatatan.length),
        ));
  }
}
