import 'dart:io';

import 'package:bookia/core/theme/app_theme.dart';
import 'package:bookia/features/intro/splash_screen.dart';
import 'package:flutter/material.dart';

class AppCore extends StatelessWidget {
  const AppCore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      builder: (context, child) {
        return (SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: child ?? Container(),
        ));
      },
      home: SplashScreen(),
    );
  }
}
