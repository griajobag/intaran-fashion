import 'dart:developer';

import 'package:get/get.dart';
import 'package:intaranfashion_mobile/app/models/catatan_entity.dart';
import 'package:intaranfashion_mobile/utils/datas/firebase_repo.dart';

class ListCatatanController extends GetxController {
  List<CatatanEntity> listCatatan = List.empty(growable: true);
  RxBool isLoading = true.obs;

  void _getCatatan() async {
    var catatans = await FirebaseRepo.getListCatatan();
    listCatatan.addAll(catatans!);
    isLoading.value = false;
  }

  @override
  void onInit() {
    isLoading.value = true;
    if (listCatatan.isNotEmpty) {
      listCatatan.clear();
    }
    _getCatatan();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
