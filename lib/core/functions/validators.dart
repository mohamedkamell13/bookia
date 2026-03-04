bool isValidEmail(String email) {
  return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
}

bool isEgyptianNumber(String phoneNumber) {
  return RegExp(r'^(?:\+20|0)(10|11|12|15)\d{8}$').hasMatch(phoneNumber);
}
