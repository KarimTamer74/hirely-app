import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_elevated_button.dart';
import 'package:hirely/core/routing/routes.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/features/onboarding/presentation/widgets/onboarding_content.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.bottomNavBarColor,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 150,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: OnBoardingContent(),
          ),
        ),
        Positioned(
          bottom: 75,
          left: 50,
          right: 50,
          child: SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              backgroundColor: AppColors.deepOrange,
              text: AppStrings.getStarted,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.mainView, (_) => false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
