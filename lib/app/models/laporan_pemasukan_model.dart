import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_entity.dart';

class LaporanPemasukanModel {
  BarangDibeliEntity? barang;
  Timestamp? tglTransaksi;
  double? qty;
  String? idMetode;
  double? total;
  double? modal;
  String? namaMetode;

  LaporanPemasukanModel(
      {this.barang,
      this.qty,
      this.total,
      this.modal,
      this.tglTransaksi,
      this.idMetode,
      this.namaMetode});
}
