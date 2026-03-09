import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/pages/login_screen.dart';
import 'package:bookia/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcome,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Positioned(
            top: 0,
            left: 22,
            right: 22,
            bottom: 0,
            child: Column(
              children: [
                Spacer(flex: 2),
                CustomSvgPicture(path: AppImages.logoSVG),
                Gap(15),
                Text('Order Your Book Now!', style: TextStyles.subtitle1),
                Spacer(flex: 4),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    pushTo(context, LoginScreen());
                  },
                ),
                Gap(15),
                MainButton(
                  bgColor: AppColors.backgroundColor,
                  textColor: AppColors.blackColor,
                  borderColor: AppColors.blackColor,
                  text: 'Register',
                  onPressed: () {
                    pushTo(context, RegisterScreen());
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
