import 'package:cloud_firestore/cloud_firestore.dart';

class PengeluaranEntity {
  Timestamp? tglPengeluaran;
  String? namaBarang;
  double? jumlah;
  String? satuan;
  String? idMetodePembayaran;
  String? namaMetodePembayaran;
  double? hargaPerSatuan;
  String? id;

  PengeluaranEntity(
      {this.tglPengeluaran,
      this.namaBarang,
      this.jumlah,
      this.satuan,
      this.idMetodePembayaran,
      this.namaMetodePembayaran,
      this.hargaPerSatuan});

  PengeluaranEntity.fromJson(Map<String, dynamic> json)
      : tglPengeluaran = json['tglPengeluaran'],
        namaBarang = json['namaBarang'],
        jumlah = json['jumlah'],
        satuan = json['satuan'],
        idMetodePembayaran = json['idMetodePembayaran'],
        namaMetodePembayaran = json['namaMetodePembayaran'],
        id = json['id'],
        hargaPerSatuan = json['hargaPerSatuan'];

  Map<String, dynamic> toJson() {
    return {
      "tglPengeluaran": tglPengeluaran,
      "namaBarang": namaBarang,
      "jumlah": jumlah,
      "satuan": satuan,
      "idMetodePembayaran": idMetodePembayaran,
      "namaMetodePembayaran": namaMetodePembayaran,
      "hargaPerSatuan": hargaPerSatuan
    };
  }

  PengeluaranEntity.fromSnapshot(DocumentSnapshot documentSnapshot)
      : tglPengeluaran = documentSnapshot['tglPengeluaran'],
        namaBarang = documentSnapshot['namaBarang'],
        jumlah = documentSnapshot['jumlah'],
        satuan = documentSnapshot['satuan'],
        idMetodePembayaran = documentSnapshot['idMetodePembayaran'],
        namaMetodePembayaran = documentSnapshot['namaMetodePembayaran'],
        hargaPerSatuan = documentSnapshot['hargaPerSatuan'],
        id = documentSnapshot.id;
}
