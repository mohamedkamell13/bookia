import 'dart:io';

import 'package:bookia/core/routes/app_router.dart';
import 'package:bookia/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppCore extends StatelessWidget {
  const AppCore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      builder: (context, child) {
        return (SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: child ?? Container(),
        ));
      },
    );
  }
}
