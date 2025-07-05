import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/app_styles.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';
import 'package:hirely/features/dashboard/data/models/application_status_model.dart'
    show ApplicationStatusModel;

class ApplicationStatusCardWidget extends StatelessWidget {
  const ApplicationStatusCardWidget({
    super.key,
  });
  static List<ApplicationStatusModel> applicationStatusModel = [
    ApplicationStatusModel(
        color: AppColors.green, status: 'Accepted', count: '3'),
    ApplicationStatusModel(
        color: AppColors.yellow, status: 'Pending', count: '12'),
    ApplicationStatusModel(
        color: AppColors.red, status: 'Rejected', count: '6'),
  ];
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
              AppStrings.status,
              style:
                  getMediumStyle(fontSize: FontSize.s16, color: Colors.black45),
            ),
            10.verticalSpace,
            ...applicationStatusModel.map((statusItem) {
              return Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: statusItem.color,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  10.horizontalSpace,
                  Text(statusItem.status, style: AppStyles.textStyle16),
                  Spacer(),
                  Text(statusItem.count,
                      style: getMediumStyle(fontSize: FontSize.s18)),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
