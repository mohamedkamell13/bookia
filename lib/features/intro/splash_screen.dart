import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/intro/welcome_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String? token = SharedPref.getToken();
    Future.delayed(Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        pushReplaceMent(context, MainAppScreen());
      } else {
        pushReplaceMent(context, WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: AppImages.logoSVG, width: 210),
            Gap(9),
            Text('Order Your Book Now!', style: TextStyles.subtitle2),
          ],
        ),
      ),
    );
  }
}
