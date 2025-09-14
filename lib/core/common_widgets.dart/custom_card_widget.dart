import 'package:flutter/material.dart';
import 'package:hirely/core/constants/app_constants.dart';
import 'package:hirely/core/utils/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.cardBorderRadius,
          ),
          color: AppColors.white,
          child: Padding(
            padding: AppConstants.cardPadding,
            child: child
          ),
        );
  }
}