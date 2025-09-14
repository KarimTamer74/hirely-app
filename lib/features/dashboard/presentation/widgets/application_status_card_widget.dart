import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_card_widget.dart';
import 'package:hirely/core/helper/enums.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';
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
    required this.jobs,
  });

  final List<JobModel> jobs;

  
  List<ApplicationStatusModel> getApplicationStatusCounts() {
    int acceptedCount = jobs
        .where((job) => job.applicationStatus == ApplicationStatus.accepted)
        .length;
    int pendingCount = jobs
        .where((job) => job.applicationStatus == ApplicationStatus.pending)
        .length;
    int rejectedCount = jobs
        .where((job) => job.applicationStatus == ApplicationStatus.rejected)
        .length;

    return [
      ApplicationStatusModel(
          color: AppColors.green,
          status: 'Accepted',
          count: acceptedCount.toString()),
      ApplicationStatusModel(
          color: AppColors.yellow,
          status: 'Pending',
          count: pendingCount.toString()),
      ApplicationStatusModel(
          color: AppColors.red,
          status: 'Rejected',
          count: rejectedCount.toString()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final statusList = getApplicationStatusCounts();

    return CustomCardWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.status,
            style: getMediumStyle(
              fontSize: FontSize.s16,
              color: AppColors.greyShade600,
            ),
          ),
          10.verticalSpace,
          ...statusList.map((statusItem) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: statusItem.color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  10.horizontalSpace,
                  Text(statusItem.status, style: AppStyles.textStyle16),
                  const Spacer(),
                  Text(statusItem.count,
                      style: getMediumStyle(fontSize: FontSize.s18)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
