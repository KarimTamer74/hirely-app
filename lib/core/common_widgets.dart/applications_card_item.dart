import 'package:flutter/material.dart';
import 'package:hirely/core/common_widgets.dart/custom_card_widget.dart';
import 'package:hirely/core/helper/functions_helper.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';

class ApplicationsCardItem extends StatelessWidget {
  const ApplicationsCardItem({
    super.key,
    required this.application,
  });
  final JobModel application;
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                application.title,
                style: getSemiBoldStyle(fontSize: FontSize.s16),
              ),
              Text(
                getApplicationStatusText(
                  application.applicationStatus,
                ),
                style: getSemiBoldStyle(
                    fontSize: FontSize.s14,
                    color: getApplicationStatusColor(
                        application.applicationStatus)),
              ),
            ],
          ),
          Text(
            application.company,
            style: getRegularStyle(
                fontSize: FontSize.s14, color: AppColors.tealGreen),
          ),
          Row(
            children: [
              Text(
                getJobType(application.jobType),
                style: getRegularStyle(
                    fontSize: FontSize.s14, color: AppColors.greyShade900),
              ),
              Text(
                " • ${getJobMode(application.jobMode)}",
                style: getRegularStyle(
                    fontSize: FontSize.s14, color: AppColors.greyShade900),
              ),
              Spacer(),
              Text(
                formatDate(application.date.toString()),
                style: getRegularStyle(
                    fontSize: FontSize.s14, color: AppColors.greyShade600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
