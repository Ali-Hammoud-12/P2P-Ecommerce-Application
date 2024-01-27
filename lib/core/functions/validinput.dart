import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not a valid Name";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not a valid email";
    }
  }
  if (type == "phone") {
    if (!isPhoneNumber(val)) {
      return "Not a valid phone Number";
    }
  }
  if (val.length < min) {
    return "can't be less then $min characters";
  }
  if (val.length > max) {
    return "can't be larger then $max characters";
  }
  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (type == "quantity") {
    if (!quantity(val)) {
      return "Not a valid number";
    }
  }
  if (type == "Pname") {
    if (!pchar(val)) {
      return "Not a valid name";
    }
  }
  if (type == "desc") {
    if (!pchar(val)) {
      return "Not a valid Description";
    }
  }

  if (type == "price") {
    if (!pprice(val)) {
      return "Not a valid number";
    }
  }

  if (type == "ShipingPrice") {
    if (!sprice(val)) {
      return "Not a valid number";
    }
  }

  if (type == "discount") {
    if (!discount(val)) {
      return "Not a valid number";
    }
  }
}

bool isPhoneNumber(String s) {
  if (s.length > 16 || s.length < 7) return false;
  return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
}

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}

bool quantity(String s) {
  int val = int.parse(s);
  if (val == 0 || val < 0) return false;
  return true;
}

bool pchar(String s) {
  if (s.isEmpty || s.isNum) return false;
  return true;
}

bool pprice(String s) {
  int val = int.parse(s);
  if (val == 0 || val < 0) return false;
  return true;
}

bool sprice(String s) {
  int val = int.parse(s);
  if (val < 0) return false;
  return true;
}

bool discount(String s) {
  int val = int.parse(s);
  if (val < 0) return false;
  return true;
}
