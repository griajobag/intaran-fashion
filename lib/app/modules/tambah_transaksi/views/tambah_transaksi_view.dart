import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/barang_entity.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/utils/components/drop_down_component.dart';
import 'package:intaranfashion_mobile/utils/components/rounded_button_full_width_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_form_field_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';
import 'package:intaranfashion_mobile/utils/globals/global_validator.dart';

import '../controllers/tambah_transaksi_controller.dart';

class TambahTransaksiView extends GetView<TambahTransaksiController> {
  const TambahTransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Transaksi'),
          centerTitle: true,
        ),
        body: Obx(
          () => ListView(
            children: [
              TextFormFieldComponent(
                  controller: controller.tglTransaksi,
                  hintText: "Tanggal transaksi",
                  readOnly: true,
                  functionOnTap: controller.openDatePicker,
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              controller.isLoadingGetBarang.value
                  ? GlobalFunction.showLoading()
                  : Row(
                      children: [
                        Expanded(
                          child: DropDownComponent<BarangEntity>(
                              labelText: "Pilih Barang",
                              objectSelected: controller.barangEntitySelected,
                              listObject: controller.listBrangEntity,
                              valueObjectAsLabel: (e) => e.namaBarang!,
                              onChangeValue: (value) {
                                controller.barangEntitySelected = value;
                                controller.hargaCon.con.text =
                                    GlobalFunction.mataUang(value.hargaJual);
                              }),
                        ),
                        TextInkwellComponent(
                            text: "Tambahkan".toUpperCase(),
                            color: GlobalColor.primaryColor,
                            functionOnTap: controller.validationTambahkan)
                      ],
                    ),
              Row(
                children: [
                  Expanded(
                    child: TextFormFieldComponent(
                        controller: controller.qtyCon,
                        hintText: "Qty",
                        textInputType: InputTypeField.number,
                        listFormatter: [FilteringTextInputFormatter.digitsOnly],
                        functionOnChange: (value) {
                          controller.hargaCon.con.text =
                              GlobalFunction.mataUang(
                                  controller.barangEntitySelected!.hargaJual! *
                                      int.parse(value));
                        },
                        functionsValidator: (value) {
                          return GlobalValidator.validatorString(value,
                              type: Constants.validatorQty);
                        }),
                  ),
                  Expanded(
                    child: TextFormFieldComponent(
                        controller: controller.hargaCon,
                        hintText: "Harga",
                        readOnly: true,
                        functionsValidator: (value) {
                          return GlobalValidator.validatorString(value);
                        }),
                  ),
                ],
              ),
              controller.listBarangDipilih!.isEmpty
                  ? Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Divider(
                            height: 1,
                            color: GlobalColor.primaryGrey,
                          ),
                        ),
                        TextComponent(
                            marginTop: 10,
                            marginBottom: 10,
                            text: "Belum ada barang yang ditambahkan"),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Divider(
                            height: 1,
                            color: GlobalColor.primaryGrey,
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextComponent(
                              text: "Data barang yang ditambahkan"),
                          ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              separatorBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.only(left: 70),
                                  child: const Divider()),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.listBarangDipilih!.length,
                              itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.shopping_basket,
                                      color: GlobalColor.colorGreen,
                                    ),
                                    title: TextComponent(
                                        text: controller
                                            .listBarangDipilih![index]
                                            .barang!
                                            .namaBarang!),
                                    subtitle: TextComponent(
                                        text: controller
                                                .listBarangDipilih![index].qty!
                                                .toInt()
                                                .toString() +
                                            "@" +
                                            GlobalFunction.mataUang(controller
                                                .listBarangDipilih![index]
                                                .barang!
                                                .hargaJual) +
                                            " = " +
                                            GlobalFunction.mataUang(controller
                                                    .listBarangDipilih![index]
                                                    .qty! *
                                                controller
                                                    .listBarangDipilih![index]
                                                    .barang!
                                                    .hargaJual!)),
                                    trailing: InkWell(
                                      onTap: () {
                                        controller.removeBarangDibeli(index);
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: GlobalColor.colorRed,
                                      ),
                                    ),
                                  ))),
                          Container(
                            alignment: Alignment.centerRight,
                            child: TextComponent(
                              textAlign: TextAlign.end,
                              text: "Total : " +
                                  GlobalFunction.mataUang(
                                      controller.totalYangHarusDibayarkan),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              TextFormFieldComponent(
                  controller: controller.namaPembeliCon,
                  hintText: "Nama pembeli",
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              TextFormFieldComponent(
                  controller: controller.alamatCon,
                  hintText: "Alamat pembeli",
                  maxLines: 4,
                  functionsValidator: (value) {
                    return GlobalValidator.validatorString(value);
                  }),
              controller.isLoadingMetode.value
                  ? GlobalFunction.showLoading()
                  : DropDownComponent<MetodePembayaranEntity>(
                      labelText: "Metode pembayaran",
                      objectSelected: controller.metodePembayaranEntitySelected,
                      listObject: controller.listMetodePembayaran,
                      valueObjectAsLabel: (e) => e.namaMetode!,
                      onChangeValue: (value) {
                        controller.metodePembayaranEntitySelected = value;
                      }),
              RoundedButtonFullWidthComponent(
                  text: "Simpan", functionClick: controller.doSimpanTransaksi)
            ],
          ),
        ));
  }
}
