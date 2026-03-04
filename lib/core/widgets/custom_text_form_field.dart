import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.focusNode,
    this.textInputAction,
    this.onChange,
    this.controller,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onChange;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        fillColor: AppColors.accentColor,
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChange,
      controller: controller,
    );
  }
}
