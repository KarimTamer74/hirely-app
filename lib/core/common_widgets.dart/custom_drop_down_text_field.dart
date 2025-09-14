import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hirely/core/utils/app_strings.dart';


class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        hint: Text("Select"),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        selectedItemBuilder: (context) {
          return [
            Text(AppStrings.fullTime),
            Text(AppStrings.partTime),
            Text(AppStrings.freelance),
            Text(AppStrings.internship),
          ];
        },
        onSaved: (newValue) {
          log("onSaved=======$newValue");
        },
        items: [
          DropdownMenuItem(
            value: '1',
            child: Text(AppStrings.fullTime),
          ),
          DropdownMenuItem(
            value: '2',
            child: Text(AppStrings.partTime),
          ),
          DropdownMenuItem(
            value: '3',
            child: Text(AppStrings.freelance),
          ),
          DropdownMenuItem(
            value: '4',
            child: Text(AppStrings.internship),
          ),
        ],
        onChanged: (value) {
          log("value ===== $value");
        });
  }
}
