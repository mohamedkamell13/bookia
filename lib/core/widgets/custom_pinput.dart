import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinput extends StatelessWidget {
  const CustomPinput({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final emptyTheme = PinTheme(
      width: 48,
      height: 60,
      textStyle: TextStyles.subtitle1,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final filledTheme = PinTheme(
      width: 48,
      height: 60,
      textStyle: TextStyles.subtitle1,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryColor),
      ),
    );

    return Pinput(
      controller: controller,
      showCursor: false,
      closeKeyboardWhenCompleted: true,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      length: 6,
      defaultPinTheme: emptyTheme,
      submittedPinTheme: filledTheme,
      followingPinTheme: emptyTheme,
    );
  }
}
