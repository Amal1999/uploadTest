import 'package:validators/validators.dart';

class StringUtility {
  StringUtility._();

  static bool isEmail(String? string) {
    if (string == null) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(string);
  }

  static bool isLengthShorterOrEqual(
      {required String? string, required int length}) {
    int strLength;
    if (string == null)
      strLength = 0;
    else
      strLength = string.length;
    return strLength <= length;
  }

  static bool isLengthLongerOrEqual(
      {required String? string, required int length}) {
    int strLength;
    if (string == null)
      strLength = 0;
    else
      strLength = string.length;
    return strLength >= length;
  }


}
