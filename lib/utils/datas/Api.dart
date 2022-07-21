import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intaranfashion_mobile/app/models/main_result_api_model.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  static String setErrorMessage(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.connectTimeout) {
        return error.message;
      } else if (error.type == DioErrorType.sendTimeout) {
        return error.message;
      } else if (error.type == DioErrorType.receiveTimeout) {
        return error.message;
      } else if (error.type == DioErrorType.response) {
        log("WAW : " + error.response.toString());
        return error.response?.data['message'];
      } else if (error.type == DioErrorType.other) {
        return error.message;
      } else {
        return error.message;
      }
    } else {
      return "$error";
    }
  }

  static Future<Dio> baseUrlDio() async {
    var dios = Dio();
    final optionsnya = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        contentType: Headers.jsonContentType,
        baseUrl: "http://192.168.1.94:8000/",
        headers: {'Authorization': 'Bearer '});
    dios.options = optionsnya;
    dios.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    return dios;
  }

  static Future<MainApiResultModel> apiGet(
    String endpoint,
  ) async {
    try {
      var dio = await baseUrlDio();
      Response r = await dio.get(endpoint + "&api_key=" + Constants.apiKey);

      return MainApiResultModel.fromJson(
        r.data,
      );
    } catch (ex) {
      throw setErrorMessage(ex);
    }
  }

  static Future<MainApiResultModel> apiPost(String endpoint,
      {Map<String, dynamic>? formData, Object? body}) async {
    try {
      formData!["api_key"] = Constants.apiKey;

      var dio = await baseUrlDio();
      Response r =
          await dio.post(endpoint, data: body ?? FormData.fromMap(formData));

      return MainApiResultModel.fromJson(
        r.data,
      );
    } catch (ex) {
      throw setErrorMessage(ex);
    }
  }
}
