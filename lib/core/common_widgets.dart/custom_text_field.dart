import 'package:flutter/material.dart';
import 'package:hirely/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixWidget,
    this.onSuffixIconPressed,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines,
    required this.lableText,
  });
  final String hintText, lableText;
  final Widget? suffixWidget;
  final void Function()? onSuffixIconPressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      controller: controller,
      decoration: InputDecoration(
        label: Text(lableText),
        hintText: hintText,
        suffixIcon: suffixWidget,
        hintStyle: AppStyles.greyTextStyle14,
      ),
    );
  }
}
