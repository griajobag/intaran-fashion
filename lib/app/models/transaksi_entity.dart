import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intaranfashion_mobile/app/models/barang_entity.dart';

class BarangDibeliEntity {
  double? qty;
  BarangEntity? barang;
  BarangDibeliEntity({this.qty, this.barang});

  BarangDibeliEntity.fromJson(Map<String, dynamic> json)
      : qty = json['qty'],
        barang = BarangEntity.fromJson(json['barang']);

  Map<String, dynamic> toJson() {
    return {"qty": qty, "barang": barang!.toJson()};
  }
}

class TransaksiEntity {
  String? id;
  Timestamp? tglTransaksi;
  String? namaPembeli;
  String? alamatPembeli;
  String? idMetodePembayaran;
  String? namaMetodePembayaran;
  FieldValue? listItem;
  double? total;
  double? modal;

  TransaksiEntity(
      {this.tglTransaksi,
      this.namaPembeli,
      this.alamatPembeli,
      this.idMetodePembayaran,
      this.listItem,
      this.total,
      this.modal,
      this.namaMetodePembayaran});

  TransaksiEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tglTransaksi = json['tglTransaksi'],
        namaPembeli = json['namaPembeli'],
        alamatPembeli = json['alamatPembeli'],
        listItem = json['items'],
        total = json['total'],
        modal = json['modal'],
        idMetodePembayaran = json['idMetodePembayaran'],
        namaMetodePembayaran = json['namaMetodePembayaran'];

  Map<String, dynamic> toJson() {
    return {
      "tglTransaksi": tglTransaksi,
      "namaPembeli": namaPembeli,
      "items": listItem,
      "total": total,
      "modal": modal,
      "alamatPembeli": alamatPembeli,
      "idMetodePembayaran": idMetodePembayaran,
      "namaMetodePembayaran": namaMetodePembayaran
    };
  }

  TransaksiEntity.fromSnapshot(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot.id,
        tglTransaksi = documentSnapshot['tglTransaksi'],
        namaPembeli = documentSnapshot['namaPembali'],
        listItem = documentSnapshot['items'],
        total = documentSnapshot['total'],
        modal = documentSnapshot['modal'],
        alamatPembeli = documentSnapshot['alamatPembeli'],
        idMetodePembayaran = documentSnapshot['idMetodePembayaran'],
        namaMetodePembayaran = documentSnapshot['namaMetodePembayaran'];
}
