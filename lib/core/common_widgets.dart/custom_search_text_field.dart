import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_styles.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
    required this.hintText,
    required this.onTextChanged,
  });
  final String hintText;
  final ValueChanged<String> onTextChanged;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        widget.onTextChanged(value);
      },
      style: AppStyles.textStyle20,
      cursorHeight: 18.h,
      cursorColor: AppColors.bluishClr,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: widget.hintText,
        suffixIcon: Icon(Icons.search, color: AppColors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.bluishClr,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.bluishClr,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.orange,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
