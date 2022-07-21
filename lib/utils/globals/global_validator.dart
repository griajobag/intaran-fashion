import 'package:intaranfashion_mobile/utils/globals/constants.dart';

class GlobalValidator {
  static String? validatorString(String value,
      {String message = "Field harus diisi.",
      String type = Constants.validatorText}) {
    if (value.isEmpty) {
      return message;
    } else {
      if (type == Constants.validatorText) {
        if (value.isEmpty) {
          return message;
        }
      } else if (type == Constants.validatorPhone) {
        if (value.toString().isEmpty) {
          return message;
        } else if (value.toString().substring(0, 1) != "0") {
          return message;
        } else if (value.toString().length < 10) {
          return "Nomer HP minimal 10 digit";
        }
      } else if (type == Constants.validatorEmail) {
        if (!MyRegex.isEmail(value.toString())) {
          return "Format email salah";
        }
      } else if (type == Constants.validatorQty) {
        if (value.toString().isEmpty) {
          return message;
        } else if (value.substring(0, 1) == "0") {
          return "Qty minimal 1";
        }
      }
    }
    return null;
  }
}
