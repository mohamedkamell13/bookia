import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:easy_localization/easy_localization.dart';
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
                'passwordChanged'.tr(),
                style: TextStyles.headline.copyWith(fontSize: 26),
              ),
              Gap(3),
              Text(
                textAlign: TextAlign.center,
                'passwordChangedmsg'.tr(),
                style: TextStyles.body.copyWith(color: AppColors.greyColor),
              ),
              Gap(40),
              MainButton(
                text: 'backToLogin'.tr(),
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
