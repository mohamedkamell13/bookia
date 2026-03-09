import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String erorrMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.errorColor,

      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      content: Center(child: Text(erorrMsg, style: TextStyles.body)),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: AppColors.blackColor.withValues(alpha: 0.7),
    context: context,
    builder: (context) => Center(child: CircularProgressIndicator()),
  );
}
