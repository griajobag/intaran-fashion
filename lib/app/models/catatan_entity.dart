import 'package:cloud_firestore/cloud_firestore.dart';

class CatatanEntity {
  Timestamp? tglCatatan;
  String? id;
  String? judul;
  String? isi;
  CatatanEntity({this.isi, this.judul, this.tglCatatan});

  CatatanEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        judul = json['judul'],
        isi = json['isi'],
        tglCatatan = json['tglCatatan'];

  Map<String, dynamic> toJson() {
    return {"judul": judul, "isi": isi, "tglCatatan": tglCatatan};
  }

  CatatanEntity.fromSnapshot(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot.id,
        judul = documentSnapshot['judul'],
        isi = documentSnapshot['isi'],
        tglCatatan = documentSnapshot['tglCatatan'];
}
