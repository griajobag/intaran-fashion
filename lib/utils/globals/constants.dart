import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static const apiKey = "a7b00cac-c579-439f-a1ec-b90c5c373057";
  static const keyRemoteConfig = "KEY_REMOTE_CONFIG";
  static const keyUserLogin = "KEY_USER_LOGIN";
  static const int pageSize = 25;
  static const String heroTagImage = "HERO_TAG_IMAGE";

//validator type
  static const String validatorText = "text";
  static const String validatorPhone = "phone";
  static const String validatorEmail = "email";
  static const String validatorQty = "qty";
}

class MyScreenSize {
  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}

class MyErrorCode {
  static const int code404 = 404;
  static const int code500 = 500;
  static const int code401 = 401;
  static const int code400 = 400;
  static const int code409 = 409;
  static const int code307 = 307;
}

class MyTextSize {
  static const double h1 = 24;
  static const double h2 = 22;
  static const double h3 = 20;
  static const double h4 = 18;
  static const double h5 = 16;
  static const double h6 = 14;
  static const double normal = 12;
  static const double small = 10;
  static const double verySmall = 8;
}

class MyIconSize {
  static const double normal = 15;
  static const double small = 11;
  static const double medium = 18;
  static const double big = 20;
}

class MyRegex {
  static String nikPattern =
      r"((1[1-9])|(21)|([37][1-6])|(5[1-4])|(6[1-5])|([8-9][1-2]))[0-9]{2}[0-9]{2}(([0-6][0-9])|(7[0-1]))((0[1-9])|(1[0-2]))([0-9]{2})[0-9]{4}";
  static bool isEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}

class MyDateFormat {
  static DateFormat dfTanggalBulan = DateFormat("dd MMM");
  static DateFormat dfTanggalBulanTahun = DateFormat("dd MMM yyyy");
  static DateFormat dfTanggalBulanTahunPlusJam =
      DateFormat("dd MMM yyyy hh:mm");
  static DateFormat dfJamMenit = DateFormat("hh:mm a");
}
