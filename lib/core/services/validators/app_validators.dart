import 'package:bookia/core/functions/validators.dart';

class AppValidators {
  static String? username(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  static String? password(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your password';
    } else if (input.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? email(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your email';
    } else if (!input.contains('@')) {
      return 'Please enter a valid email';
    } else if (!isValidEmail(input)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phone(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your phone number';
    } else if (!isEgyptianNumber(input)) {
      return 'Please enter a valid Egyptian phone number';
    }
    return null;
  }
}
