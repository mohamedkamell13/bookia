import 'package:bookia/core/functions/validators.dart';
import 'package:easy_localization/easy_localization.dart';

class AppValidators {
  static String? username(String? input) {
    if (input == null || input.isEmpty) {
      return 'validUsername'.tr();
    }
    return null;
  }

  static String? password(String? input) {
    if (input == null || input.isEmpty) {
      return 'validPassword'.tr();
    } else if (input.length < 6) {
      return 'validPasswordLength'.tr();
    }
    return null;
  }

  static String? email(String? input) {
    if (input == null || input.isEmpty) {
      return 'validEmail'.tr();
    } else if (!input.contains('@') || !isValidEmail(input)) {
      return 'validEmailFormat'.tr();
    }
    return null;
  }

  static String? phone(String? input) {
    if (input == null || input.isEmpty) {
      return 'validPhone'.tr();
    } else if (!isEgyptianNumber(input)) {
      return 'validPhoneFormat'.tr();
    }
    return null;
  }
}
