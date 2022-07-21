import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/container_component.dart';
import 'package:intaranfashion_mobile/utils/components/table_horizontal_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

import '../controllers/laporan_pemasukan_controller.dart';

class LaporanPemasukanView extends GetView<LaporanPemasukanController> {
  const LaporanPemasukanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LaporanPemasukanController());
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Obx(() => ListView(
              children: [
                controller.isLoadingGetData.value
                    ? Visibility(visible: false, child: Container())
                    : ContainerComponent(
                        padding: 10,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: TextComponent(
                                  text: "Modal\n" +
                                      GlobalFunction.mataUang(
                                          controller.totalModal.value),
                                  textAlign: TextAlign.center,
                                )),
                                Expanded(
                                    child: TextComponent(
                                  text: "Omset\n" +
                                      GlobalFunction.mataUang(
                                          controller.totalOmset.value),
                                  textAlign: TextAlign.center,
                                )),
                                Expanded(
                                    child: TextComponent(
                                  text: "Laba\n" +
                                      GlobalFunction.mataUang(
                                          controller.totalLabaBersih.value),
                                  textAlign: TextAlign.center,
                                )),
                              ],
                            ),
                            const Divider(),
                            ContainerComponent(
                                child: MasonryGridView.count(
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 4,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              itemCount:
                                  controller.listTotalUangPerMetode.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    TextComponent(
                                        text: controller
                                            .listTotalUangPerMetode[index]
                                            .namaMetode!),
                                    TextComponent(
                                        text: GlobalFunction.mataUang(controller
                                            .listTotalUangPerMetode[index]
                                            .total)),
                                  ],
                                );
                              },
                            ))
                          ],
                        ),
                      ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                controller.isLoadingGetData.value
                    ? GlobalFunction.showLoading()
                    : ContainerComponent(
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    Expanded(
                                      child: TableHorizontalComponent(
                                          indexNolPhone: 3,
                                          indexSatuPhone: 1,
                                          indexDuaPhone: 12,
                                          listTableRow: [
                                            TableRow(children: [
                                              const TextComponent(
                                                  text: "Barang"),
                                              const TextComponent(text: ":"),
                                              TextComponent(
                                                  text: controller
                                                      .listLaporanPemasukan[
                                                          index]
                                                      .barang!
                                                      .barang!
                                                      .namaBarang!)
                                            ]),
                                            TableRow(children: [
                                              const TextComponent(
                                                  text: "Tanggal"),
                                              const TextComponent(text: ":"),
                                              TextComponent(
                                                  text: MyDateFormat
                                                      .dfTanggalBulanTahunPlusJam
                                                      .format(controller
                                                          .listLaporanPemasukan[
                                                              index]
                                                          .tglTransaksi!
                                                          .toDate()))
                                            ]),
                                            TableRow(children: [
                                              const TextComponent(
                                                  text: "Jumlah"),
                                              const TextComponent(text: ":"),
                                              TextComponent(
                                                  text: controller
                                                      .listLaporanPemasukan[
                                                          index]
                                                      .qty
                                                      .toString())
                                            ]),
                                            TableRow(children: [
                                              const TextComponent(
                                                  text: "Modal"),
                                              const TextComponent(text: ":"),
                                              TextComponent(
                                                  text: GlobalFunction.mataUang(
                                                      controller
                                                          .listLaporanPemasukan[
                                                              index]
                                                          .barang!
                                                          .barang!
                                                          .hargaAwal))
                                            ]),
                                            TableRow(children: [
                                              const TextComponent(
                                                  text: "Harga"),
                                              const TextComponent(text: ":"),
                                              TextComponent(
                                                  text: GlobalFunction.mataUang(
                                                      controller
                                                          .listLaporanPemasukan[
                                                              index]
                                                          .barang!
                                                          .barang!
                                                          .hargaJual))
                                            ])
                                          ]),
                                    ),
                                    TextComponent(
                                        marginRight: 10,
                                        textAlign: TextAlign.center,
                                        text: "Laba\n" +
                                            GlobalFunction.mataUang((controller
                                                        .listBarangDiBeli[index]
                                                        .barang!
                                                        .hargaJual! -
                                                    controller
                                                        .listLaporanPemasukan[
                                                            index]
                                                        .barang!
                                                        .barang!
                                                        .hargaAwal!) *
                                                controller
                                                    .listBarangDiBeli[index]
                                                    .qty!))
                                  ],
                                ),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: controller.listLaporanPemasukan.length),
                      ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: GlobalColor.primaryColor,
            onPressed: controller.onTapFilter,
            child: const Icon(Icons.filter_alt),
          ),
        ),
      ],
    );
  }
}
