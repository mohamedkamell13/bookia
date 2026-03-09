import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            pushTo(context, ForgotPasswordScreen());
          },
          child: Text(
            'Forgot Password?',
            style: TextStyles.caption1.copyWith(color: AppColors.darkGreyColor),
          ),
        ),
      ],
    );
  }
}
