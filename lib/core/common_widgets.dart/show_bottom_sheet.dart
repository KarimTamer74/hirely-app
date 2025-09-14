import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_elevated_button.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_styles.dart';

void showSuccessBottomSheet(
  BuildContext context, {
  required String title,
  String? image,
  required String message,
  required String textButton,
  required void Function() onFirstButtonPressed,
  required void Function() onSecondButtonPressed,
}) {
  showModalBottomSheet(
    useSafeArea: true,
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: SuccessBottomSheet(
          textMessage: message,
          textButton: textButton,
          onFirstButtonPressed: onFirstButtonPressed,
          onSecondButtonPressed: onSecondButtonPressed,
          image: image,
          title: title,
        ),
      );
    },
  );
}

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({
    super.key,
    required this.textMessage,
    required this.textButton,
    required this.onFirstButtonPressed,
    required this.onSecondButtonPressed,
    required this.title,
    this.image,
  });

  final String textMessage;
  final String textButton, title;
  final void Function() onFirstButtonPressed, onSecondButtonPressed;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Success icon and message
          Image.asset(
            image ?? "AppImages.successImage",
          ),
          10.verticalSpace,
          Text(
            title,
            style: AppStyles.textStyleBold18,
            textAlign: TextAlign.center,
          ),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  onPressed: onFirstButtonPressed,
                  text: 'Continue',
                  backgroundColor: AppColors.greyShade900,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomElevatedButton(
                  onPressed: onSecondButtonPressed,
                  text: 'Add New Task',
                  backgroundColor: AppColors.primaryBlueClr,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
