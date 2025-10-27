import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_elevated_button.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final String? lottieAsset;
  final double size;
  final VoidCallback? onRetry;

  const CustomErrorWidget({
    super.key,
    required this.message,
    this.lottieAsset,
    this.size = 200,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (lottieAsset != null)
          //   Lottie.asset(
          //     lottieAsset!,
          //     width: size,
          //     height: size,
          //     repeat: true,
          //   ),

          8.verticalSpace,

          // Icon / visual
          Container(
            decoration: BoxDecoration(
              color: AppColors.redShade50.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(16.w),
            child: Icon(
              Icons.error_outline,
              color: AppColors.red,
              size: 48.sp,
            ),
          ),

          16.verticalSpace,
          Text(
            message,
            style:
                getSemiBoldStyle(fontSize: FontSize.s22, color: AppColors.red),
            textAlign: TextAlign.center,
          ),

          16.verticalSpace,
          if (onRetry != null) ...[
            CustomElevatedButton(
              text: AppStrings.retry,
              onPressed: onRetry,
            )
          ],
        ],
      ),
    );
  }
}
