import 'dart:convert';

import 'package:intaranfashion_mobile/app/models/main_result_api_model.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static Future<void> setLoginUserToLocal(
      MainApiResultModel responseLoginModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        Constants.keyUserLogin, json.encode(responseLoginModel.toJson()));
  }

  static Future<MainApiResultModel> getLoginUserFromLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? value = sharedPreferences.getString(Constants.keyUserLogin);
    if (value == null) {
      return MainApiResultModel();
    } else {
      MainApiResultModel responseLoginModel = MainApiResultModel.fromJson(
          (value == null) ? <String, dynamic>{} : json.decode(value));
      return responseLoginModel;
    }
  }
}
