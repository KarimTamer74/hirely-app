import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.backgroundColor,
    this.onPressed,
    required this.text,
  });
  final Color? backgroundColor;
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 45.h),
          backgroundColor: backgroundColor ?? AppColors.primaryBlueClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.textStyleBold16.copyWith(
            color: onPressed == null ? AppColors.grayColor : AppColors.white,
          ),
        ));
  }
}
