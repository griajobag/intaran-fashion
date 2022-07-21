import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/routes/app_pages.dart';
import 'package:intaranfashion_mobile/utils/components/menu_image_judul_desc_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextComponent(
                        text: "Hai, " +
                            FirebaseAuth.instance.currentUser!.displayName!),
                  ),
                  InkWell(
                    onTap: controller.doLogout,
                    child: const Icon(
                      Icons.logout,
                      color: GlobalColor.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const TextComponent(
                  textSize: MyTextSize.small,
                  text:
                      "Selamat datang kembali di aplikasi pencatatan transaksi Intaran Fashion"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Divider(
                height: 1,
                color: GlobalColor.greyInputan,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: TextComponent(
                text: "Pemasukan".toUpperCase(),
                textSize: MyTextSize.normal,
                textColor: GlobalColor.colorOrangLebihTua,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/transaction.png",
                      menuTitle: "Transaksi",
                      menuDesc: "Mencakup setiap transaksi yang terjadi",
                      functionOnTap: () {
                        Get.toNamed(Routes.TAMBAH_TRANSAKSI);
                      }),
                ),
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/tabledua.png",
                      menuTitle: "Data Transaksi",
                      menuDesc: "Mencakup data tiap transaksi yang terjadi",
                      functionOnTap: () {
                        Get.toNamed(Routes.LIST_TRANSAKSI);
                      }),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 20),
              child: TextComponent(
                text: "Pengeluaran".toUpperCase(),
                textSize: MyTextSize.normal,
                textColor: GlobalColor.colorOrangLebihTua,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/outcome.png",
                      menuTitle: "Catat Pengeluaran",
                      menuDesc: "Transaksi pengeluaran toko",
                      functionOnTap: () {
                        Get.toNamed(Routes.TAMBAH_PENGELUARAN);
                      }),
                ),
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/tabletiga.png",
                      menuTitle: "Data Pengeluaran",
                      menuDesc: "Data pengeluaran toko",
                      functionOnTap: () {
                        Get.toNamed(Routes.LIST_DATA_PENGELUARAN);
                      }),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 20),
              child: TextComponent(
                text: "Stok".toUpperCase(),
                textSize: MyTextSize.normal,
                textColor: GlobalColor.colorOrangLebihTua,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/tambahbarang.png",
                      menuTitle: "Tambah Stok",
                      menuDesc: "Menu untuk menambah barang / stok",
                      functionOnTap: () {
                        Get.toNamed(Routes.TAMBAH_BARANG);
                      }),
                ),
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/table.png",
                      menuTitle: "Data Barang",
                      menuDesc: "Mencakup data tiap barang yang disimpan",
                      functionOnTap: () {
                        Get.toNamed(Routes.LIST_DATA_BARANG);
                      }),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 20),
              child: TextComponent(
                text: "Metode Pembayaran".toUpperCase(),
                textSize: MyTextSize.normal,
                textColor: GlobalColor.colorOrangLebihTua,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/payment.png",
                      menuTitle: "Tambah Baru",
                      menuDesc: "Menambah metode pembayaran",
                      functionOnTap: () {
                        Get.toNamed(Routes.TAMBAH_METODE_PEMBAYARAN);
                      }),
                ),
                Expanded(
                  child: MenuImageJudulDescComponent(
                      assetImage: "assets/datapayment.png",
                      menuTitle: "Lihat Semua",
                      menuDesc: "Data metode pembayaran yang tersedia",
                      functionOnTap: () {
                        Get.toNamed(Routes.LIST_METODE_PEMBAYARAN);
                      }),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            MenuImageJudulDescComponent(
                assetImage: "assets/report.png",
                menuTitle: "Laporan",
                menuDesc: "Mencakup laporan laba dan rugi toko",
                functionOnTap: () {
                  Get.toNamed(Routes.SLIDING_TAB_LAPORAN);
                }),
            const Padding(padding: EdgeInsets.only(top: 10)),
            MenuImageJudulDescComponent(
                assetImage: "assets/pencil.png",
                menuTitle: "Notepad",
                menuDesc: "Catatan penting yang disimpan",
                functionOnTap: () {
                  Get.toNamed(Routes.LIST_CATATAN);
                }),
            const Padding(padding: EdgeInsets.only(top: 10)),
            MenuImageJudulDescComponent(
                assetImage: "assets/settings.png",
                menuTitle: "Pengaturan",
                menuDesc: "Pengaturan aplikasi mencakup gambar dan tulisan",
                functionOnTap: () {}),
          ],
        ),
      ),
    );
  }
}
