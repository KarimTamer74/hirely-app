import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_card_widget.dart';
import 'package:hirely/core/helper/enums.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';
import 'package:hirely/features/dashboard/data/models/application_type_model.dart';

class ApplicationTypeCardWidget extends StatelessWidget {
  const ApplicationTypeCardWidget({super.key, required this.jobs});
  final List<JobModel> jobs;
  List<ApplicationTypeModel> applicationTypes() {
    int fullTime = jobs.where((job) => job.jobType == JobType.fullTime).length;
    int partTime = jobs.where((job) => job.jobType == JobType.partTime).length;
    int intern=jobs.where((job) => job.jobType == JobType.intern).length;
    return  [
    ApplicationTypeModel(
        type: AppStrings.fullTime, count:fullTime.toString(), backgroundColor: Colors.green),
    ApplicationTypeModel(
        type: AppStrings.partTime, count: partTime.toString(), backgroundColor: Colors.red),
    ApplicationTypeModel(
        type: AppStrings.internship,
        count: intern.toString(),
        backgroundColor: Colors.yellow),
    // ApplicationTypeModel(
    //     type: AppStrings.freelance, count: '2', backgroundColor: Colors.blue)
  ];
  }

  @override
  Widget build(BuildContext context) {
    final List<ApplicationTypeModel> types = applicationTypes();

    return CustomCardWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.applicationType,
                style: getSemiBoldStyle(fontSize: FontSize.s16),
              ),
              Text(
                AppStrings.last30Days,
                style: getRegularStyle(
                    fontSize: FontSize.s14, color: AppColors.greyShade600),
              )
            ],
          ),
          10.verticalSpace,
          Wrap(
            spacing: 20.w,
            runSpacing: 20.h,
            children: [
              ...types.map((type) {
                return Column(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: type.backgroundColor),
                      child: Center(
                        child: Text(
                          type.count.toString(),
                          style: getMediumStyle(fontSize: FontSize.s20),
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      type.type,
                      style: getMediumStyle(
                          fontSize: FontSize.s15,
                          color: AppColors.greyShade700),
                    )
                  ],
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
