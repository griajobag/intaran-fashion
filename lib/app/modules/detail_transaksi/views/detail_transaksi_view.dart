import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/utils/components/table_horizontal_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

import '../controllers/detail_transaksi_controller.dart';

class DetailTransaksiView extends GetView<DetailTransaksiController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Transaksi'),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextComponent(
                    text: "Berikut ini adalah detail transaksi dari " +
                        controller.transaksiFromFirestoreEntity.namaPembeli! +
                        " yang dilakukan pada tanggal " +
                        MyDateFormat.dfTanggalBulanTahunPlusJam.format(
                            controller
                                .transaksiFromFirestoreEntity.tglTransaksi!
                                .toDate())),
                ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) => ListTile(
                        leading: const Icon(Icons.shopping_bag),
                        title: TextComponent(
                            text: controller.transaksiFromFirestoreEntity
                                .listItem![index].barang!.namaBarang!),
                        subtitle: TextComponent(
                            text: controller.transaksiFromFirestoreEntity
                                    .listItem![index].qty!
                                    .toInt()
                                    .toString() +
                                "@" +
                                GlobalFunction.mataUang(controller
                                    .transaksiFromFirestoreEntity
                                    .listItem![index]
                                    .barang!
                                    .hargaJual)),
                        trailing: TextComponent(
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                            text: "Total\n" +
                                GlobalFunction.mataUang(controller.transaksiFromFirestoreEntity.listItem![index].qty! * controller.transaksiFromFirestoreEntity.listItem![index].barang!.hargaJual!)))),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: controller.transaksiFromFirestoreEntity.listItem!.length),
                TableHorizontalComponent(listTableRow: [
                  TableRow(children: [
                    const TextComponent(text: "Alamat Pembeli"),
                    const TextComponent(text: ":"),
                    TextComponent(
                        text: controller
                            .transaksiFromFirestoreEntity.alamatPembeli!),
                  ]),
                  TableRow(children: [
                    const TextComponent(text: "Metode Bayar"),
                    const TextComponent(text: ":"),
                    TextComponent(
                        text: controller.transaksiFromFirestoreEntity
                            .namaMetodePembayaran!),
                  ]),
                  TableRow(children: [
                    const TextComponent(text: "Total Bayar"),
                    const TextComponent(text: ":"),
                    TextComponent(
                      text: controller.totalHarga(),
                      fontWeight: FontWeight.bold,
                    ),
                  ])
                ])
              ],
            ),
          ),
        ));
  }
}
