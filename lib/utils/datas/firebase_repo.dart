import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intaranfashion_mobile/app/models/barang_entity.dart';
import 'package:intaranfashion_mobile/app/models/catatan_entity.dart';
import 'package:intaranfashion_mobile/app/models/metode_pembayaran_entity.dart';
import 'package:intaranfashion_mobile/app/models/pengeluaran_entity.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_entity.dart';
import 'package:intaranfashion_mobile/app/models/transaksi_from_firestore_entity.dart';

class FirebaseRepo {
  static FirebaseAuth? firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn? googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  static FirebaseFirestore? firestore = FirebaseFirestore.instance;

  static Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn!.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await firebaseAuth?.signInWithCredential(authCredential);
      return firebaseAuth!.currentUser!;
    } catch (e) {
      log("Google Error : " + e.toString());
      throw Exception(e);
    }
  }

  static Future<void>? tambahMetodePembayaran(
      String namaMetode, String nomerMetode) async {
    try {
      await firestore!
          .collection("metodePembayaran")
          .add({"namaMetode": namaMetode, "nomerMetode": nomerMetode});
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<MetodePembayaranEntity>?> getListMetodePembayaran() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore!.collection("metodePembayaran").get();
      return querySnapshot.docs
          .map((e) => MetodePembayaranEntity.fromSnapshot(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> tambaBarang(BarangEntity barangEntity) async {
    try {
      await firestore!.collection("barang").add(barangEntity.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<BarangEntity>> getListBarang() async {
    try {
      QuerySnapshot querySnapshot = await firestore!.collection("barang").get();
      return querySnapshot.docs
          .map((e) => BarangEntity.fromSnapshot(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> tambahPengeluaran(
      PengeluaranEntity pengeluaranEntity) async {
    try {
      await firestore!
          .collection("pengeluaran")
          .add(pengeluaranEntity.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<PengeluaranEntity>> getListPengeluaran() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore!.collection("pengeluaran").get();
      return querySnapshot.docs
          .map((e) => PengeluaranEntity.fromSnapshot(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> tambahTransaksi(TransaksiEntity transaksiEntity) async {
    try {
      log(transaksiEntity.toJson().toString());
      await firestore!.collection("transaksi").add(transaksiEntity.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<TransaksiFromFirestoreEntity>> getListTransaksi(
      {DateTime? dateTime, String? idMetode}) async {
    try {
      QuerySnapshot querySnapshot = await firestore!
          .collection("transaksi")
          .where('tglTransaksi', isEqualTo: dateTime)
          .where("idMetodePembayaran", isEqualTo: idMetode)
          .get();

      return querySnapshot.docs.map((e) {
        List<BarangDibeliEntity> barangDibeli = [];
        List<dynamic> listItemsBarang = e['items'];
        for (var element in listItemsBarang) {
          barangDibeli.add(BarangDibeliEntity(
              qty: element['qty'],
              barang: BarangEntity.fromJson(element['barang'])));
        }
        return TransaksiFromFirestoreEntity(
            alamatPembeli: e['alamatPembeli'],
            idMetodePembayaran: e['idMetodePembayaran'],
            listItem: barangDibeli,
            modal: e['modal'],
            total: e['total'],
            namaMetodePembayaran: e['namaMetodePembayaran'],
            namaPembeli: e['namaPembeli'],
            tglTransaksi: e['tglTransaksi']);
      }).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> tambahCatatan(CatatanEntity catatanEntity) async {
    try {
      await firestore!.collection("catatan").add(catatanEntity.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<CatatanEntity>?> getListCatatan() async {
    QuerySnapshot querySnapshot = await firestore!.collection("catatan").get();
    return querySnapshot.docs
        .map((e) => CatatanEntity.fromSnapshot(e))
        .toList();
  }
}
