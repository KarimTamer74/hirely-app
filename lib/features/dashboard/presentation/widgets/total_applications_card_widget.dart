import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';

class TotalApplicationsCardWidget extends StatelessWidget {
  const TotalApplicationsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.totalApplications,
              style:
                  getMediumStyle(fontSize: FontSize.s16, color: Colors.black45),
            ),
            10.verticalSpace,
            Text('20', style: getBoldStyle(fontSize: FontSize.s24))
          ],
        ),
      ),
    );
  }
}
