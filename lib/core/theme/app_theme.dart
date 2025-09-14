import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_styles.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        datePickerTheme: DatePickerThemeData(),
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: 'Nunito',
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          foregroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          shadowColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
        ),
        buttonTheme: ButtonThemeData(minWidth: double.infinity),
        iconTheme: IconThemeData(color: AppColors.greyShade700),
        chipTheme: ChipThemeData(
            backgroundColor: AppColors.white,
            selectedColor: AppColors.bluishClr,
            disabledColor: AppColors.grayColor,
            selectedShadowColor: AppColors.bluishClr,
            labelStyle:
                getMediumStyle(fontSize: FontSize.s16, color: AppColors.black),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(25))),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppStyles.greyTextStyle14,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.bluishClr, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.grayColor, width: 2),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.black,
        fontFamily: 'Nunito',
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: AppColors.black,
          shadowColor: AppColors.black,
          backgroundColor: AppColors.black,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.white),
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
        iconTheme: IconThemeData(color: AppColors.greyShade500),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppStyles.greyTextStyle14,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.bluishClr, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.greyShade800, width: 2),
          ),
        ),
      );
}
