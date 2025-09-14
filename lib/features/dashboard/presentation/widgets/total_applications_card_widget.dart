import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_card_widget.dart';
import 'package:hirely/core/network/job_model.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';

class TotalApplicationsCardWidget extends StatelessWidget {
  const TotalApplicationsCardWidget({
    super.key,
    required this.jobs,
  });
  final List<JobModel> jobs;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.totalApplications,
            style: getMediumStyle(
                fontSize: FontSize.s16, color: AppColors.greyShade600),
          ),
          10.verticalSpace,
          Text(jobs.length.toString(),
              style: getBoldStyle(fontSize: FontSize.s24))
        ],
      ),
    );
  }
}
