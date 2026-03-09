import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.emailController,
    required this.hintText,
    this.validator,
  });

  final TextEditingController emailController;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: hintText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: validator,
    );
  }
}
