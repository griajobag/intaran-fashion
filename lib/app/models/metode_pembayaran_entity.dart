import 'package:cloud_firestore/cloud_firestore.dart';

class MetodePembayaranEntity {
  String? namaMetode;
  String? nomerMetode;
  String? id;

  MetodePembayaranEntity({this.namaMetode, this.nomerMetode});

  MetodePembayaranEntity.fromJson(Map<String, dynamic> json)
      : namaMetode = json['namaMetode'],
        nomerMetode = json['nomerMetode'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {"namaMetode": namaMetode, "nomerMetode": nomerMetode, "id": id};
  }

  MetodePembayaranEntity.fromSnapshot(DocumentSnapshot documentSnapshot)
      : namaMetode = documentSnapshot['namaMetode'],
        nomerMetode = documentSnapshot['nomerMetode'],
        id = documentSnapshot.id;
}
