import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hirely/core/utils/app_strings.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.items,
    required this.selectedItem,
    this.value,
    this.hintText = AppStrings.select,
  });

  final List<DropdownMenuItem> items;
  final Function(dynamic) selectedItem;
  final dynamic value;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      hint: Text(hintText),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      validator: (val) {
        if (val == null) {
          return "Please select $hintText";
        }
        return null;
      },
      items: items,
      onChanged: (value) {
        log("value ===== $value");
        selectedItem(value);
      },
    );
  }
}
