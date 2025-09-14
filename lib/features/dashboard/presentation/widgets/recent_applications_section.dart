import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/network/repo_impl.dart';
import 'package:hirely/core/network/services_locator.dart';
import 'package:hirely/core/routing/routes.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';
import 'package:hirely/features/dashboard/presentation/widgets/recent_applications_list_view.dart';

class RecentApplicationsSection extends StatelessWidget {
  const RecentApplicationsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: JobsCubit(sl<RepoImplementation>())..getRecentJobs(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.recentApplications,
                style: getSemiBoldStyle(fontSize: FontSize.s16),
              ),
              TextButton(
                onPressed: () {
                  log("See All Clicked");
                  Navigator.pushNamed(context, Routes.mainView, arguments: 2);
                },
                child: Text(
                  AppStrings.seeAll,
                  style: getSemiBoldStyle(
                      fontSize: FontSize.s14, color: AppColors.primaryBlueClr),
                ),
              )
            ],
          ),
          SizedBox(height: 300.h, child: const RecentApplicationsListView())
        ],
      ),
    );
  }
}
