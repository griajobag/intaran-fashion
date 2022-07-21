import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_entity.dart';

class TransaksiFromFirestoreEntity {
  String? id;
  Timestamp? tglTransaksi;
  String? namaPembeli;
  String? alamatPembeli;
  String? idMetodePembayaran;
  String? namaMetodePembayaran;
  double? total;
  double? modal;
  List<BarangDibeliEntity>? listItem;

  TransaksiFromFirestoreEntity(
      {this.tglTransaksi,
      this.namaPembeli,
      this.alamatPembeli,
      this.idMetodePembayaran,
      this.listItem,
      this.total,
      this.modal,
      this.namaMetodePembayaran});

  TransaksiFromFirestoreEntity.fromJson(Map<String, dynamic> json)
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

  // TransaksiEntity.fromSnapshot(DocumentSnapshot documentSnapshot)
  //     : id = documentSnapshot.id,
  //       tglTransaksi = documentSnapshot['tglTransaksi'],
  //       namaPembeli = documentSnapshot['namaPembali'],
  //       listItem = documentSnapshot['items'],
  //       alamatPembeli = documentSnapshot['alamatPembeli'],
  //       idMetodePembayaran = documentSnapshot['idMetodePembayaran'],
  //       namaMetodePembayaran = documentSnapshot['namaMetodePembayaran'];
}
