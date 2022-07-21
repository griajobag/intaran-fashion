// To parse this JSON data, do
//
//     final mainApiResultModel = mainApiResultModelFromJson(jsonString);

import 'dart:convert';

// MainApiResultModel mainApiResultModelFromJson(String str) =>
//     MainApiResultModel.fromJson(json.decode(str));

// String mainApiResultModelToJson(MainApiResultModel data) =>
//     json.encode(data.toJson());

class MainApiResultModel {
  MainApiResultModel(
      {this.status,
      this.message,
      this.statusCode,
      this.accessToken,
      this.tokenType,
      this.data});

  bool? status;
  String? message;
  int? statusCode;
  String? accessToken;
  String? tokenType;
  Map<String, dynamic>? data;

  factory MainApiResultModel.fromJson(Map<String, dynamic> json) {
    return MainApiResultModel(
        status: json["status"],
        message: json["message"],
        statusCode: json["status_code"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: Map<String, dynamic>.from(json['data']));
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "status_code": statusCode,
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data ?? Map<String, dynamic>
      };
}
