import 'package:proofmaster/app/domain/entities/input_text/inputtext.dart';

extension InputTextExtension on InputText {
  String? validateInput(String currentValue) {
    if (regexCheck != null && !RegExp(regexCheck!).hasMatch(currentValue)) {
      return "Input tidak sesuai format";
    }
    if (isRequired == true && currentValue == "") {
      print("Input perlu diisi!");
      return "Input perlu diisi!";
    }
    if (minLen != null && currentValue.length < minLen!) {
      print("Input minimal $minLen karaketer");
      return "Input minimal $minLen karaketer!";
    }
    if (maxLen != null && currentValue.length > maxLen!) {
      print("Input minimal $maxLen karaketer");
      return "Input maksimal $maxLen karaketer!";
    }
    return null;
  }

  bool checkIsValid() {
    return value.isNotEmpty && errorMessage == null;
  }
}
