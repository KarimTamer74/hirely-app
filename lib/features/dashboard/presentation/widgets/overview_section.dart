import 'package:flutter/material.dart';
import 'package:hirely/core/theme/app_colors.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/app_styles.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.overview,
          style: AppStyles.textStyleBold22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: AppColor.white,
              child: Column(
                children: [
                  Text(
                    AppStrings.totalApplications,
                    style: AppStyles.textStyle16,
                  ),
                  Text('20', style: getBoldStyle(fontSize: FontSize.s24))
                ],
              ),
            ),
            Card(
              color: AppColor.white,
              child: Column(
                children: [
                  Text(
                    AppStrings.status,
                    style: AppStyles.textStyle16,
                  ),
                  ListTile(
                    leading: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: AppColors.redShade900,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    title:
                        Text(AppStrings.pending, style: AppStyles.textStyle16),
                    trailing:
                        Text('10', style: getBoldStyle(fontSize: FontSize.s24)),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
