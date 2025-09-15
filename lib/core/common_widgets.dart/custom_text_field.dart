import 'package:flutter/material.dart';
import 'package:hirely/core/utils/app_strings.dart';
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
    this.isValidate = false,
  });
  final String hintText, lableText;
  final Widget? suffixWidget;
  final void Function()? onSuffixIconPressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool isValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: isValidate
          ? (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.fieldCanNotBeEmpty;
              }
              return null;
            }
          : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
