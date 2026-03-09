import 'package:bookia/features/auth/presentation/widgets/text_rich.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.textSpan,
    required this.textButton,
    required this.onPressed,
  });
  final String textSpan;
  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextRich(
            textSpan: textSpan,
            textButton: textButton,
            onpressed: onPressed,
          ),
        ],
      ),
    );
  }
}
