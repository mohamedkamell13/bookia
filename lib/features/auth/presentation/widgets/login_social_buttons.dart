import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(45),
            Text('Or', style: TextStyles.caption1),
            Gap(45),
            Expanded(child: Divider()),
          ],
        ),
        Gap(21),
        SocialButton(
          path: AppImages.google,
          text: 'Sign in with Google',
          onTap: () {},
        ),
        Gap(15),
        SocialButton(
          path: AppImages.apple,
          text: 'Sign in with Apple',
          onTap: () {},
        ),
      ],
    );
  }
}
