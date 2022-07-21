import 'package:cloud_firestore/cloud_firestore.dart';

class BarangEntity {
  String? namaBarang;
  double? hargaAwal;
  double? hargaJual;
  double? stok;

  BarangEntity({this.namaBarang, this.hargaAwal, this.hargaJual, this.stok});

  BarangEntity.fromJson(Map<String, dynamic> json)
      : namaBarang = json['namaBarang'],
        hargaAwal = json['hargaAwal'],
        hargaJual = json['hargaJual'],
        stok = json['stok'];

  Map<String, dynamic> toJson() {
    return {
      "namaBarang": namaBarang,
      "hargaAwal": hargaAwal,
      "hargaJual": hargaJual,
      "stok": stok
    };
  }

  factory BarangEntity.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return BarangEntity.fromJson(
        documentSnapshot.data() as Map<String, dynamic>);
  }
}
