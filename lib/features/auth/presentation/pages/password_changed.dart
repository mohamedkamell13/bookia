import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgPicture(path: AppImages.done),
              Gap(35),
              Text(
                'Password Changed!',
                style: TextStyles.headline.copyWith(fontSize: 26),
              ),
              Gap(3),
              Text(
                textAlign: TextAlign.center,
                'Your password has been changed successfully.',
                style: TextStyles.body.copyWith(color: AppColors.greyColor),
              ),
              Gap(40),
              MainButton(
                text: 'Back To Login',
                onPressed: () {
                  pushReplaceMent(context, Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
