import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/assets_manager.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsManager.appOnboarding),
        10.verticalSpace,
        Text(
          AppStrings.onBoardingTitle,
          style: GoogleFonts.nunito(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        24.verticalSpace,
        Text(
          AppStrings.onBoardingDescription,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
