import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final String? lottieAsset;
  final double size;

  const CustomErrorWidget({
    super.key,
    required this.message,
    this.lottieAsset,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (lottieAsset != null)
            Lottie.asset(
              lottieAsset!,
              width: size,
              height: size,
              repeat: true,
            ),

         20.verticalSpace,

          // Message
          Text(
            message,
            style: getMediumStyle(fontSize: FontSize.s18, color: AppColors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
