import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TextRich extends StatelessWidget {
  const TextRich({
    super.key,
    required this.textSpan,
    required this.textButton,
    required this.onpressed,
  });
  final String textSpan;
  final String textButton;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: textSpan,
            style: TextStyles.caption2.copyWith(fontWeight: FontWeight.w600),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onpressed,
              child: Text(
                textButton,
                style: TextStyles.caption2.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
