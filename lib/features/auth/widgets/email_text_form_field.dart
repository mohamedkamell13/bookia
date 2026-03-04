import 'package:bookia/core/functions/validators.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.emailController,
    required this.hintText,
  });

  final TextEditingController emailController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: hintText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (input) {
        if (input!.isEmpty) {
          return 'please enter your email';
        } else if (!input.contains('@')) {
          return 'please enter a valid Email';
        } else if (!isValidEmail(input)) {
          return 'please entar a valid email';
        }
        return null;
      },
    );
  }
}
