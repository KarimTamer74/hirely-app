import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_error_widget.dart';
import 'package:hirely/core/common_widgets.dart/custom_loading_indicator.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/assets_manager.dart';
import 'package:hirely/features/dashboard/presentation/widgets/overview_section.dart';
import 'package:hirely/features/dashboard/presentation/widgets/recent_applications_section.dart';

class DashboardScreenBody extends StatelessWidget {
  const DashboardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.bluishClr,
      color: AppColors.white,
      onRefresh: () {
        context.read<JobsCubit>().fetchJobs();
        context.read<JobsCubit>().getRecentJobs();
        return Future.value();
      },
      child: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) {
          if (state is JobLoading) {
            log("Loading..........");
            return CustomLoadingIndicator();
          }
          if (state is JobFailure) {
            log("Error: ${state.message}");
            return CustomErrorWidget(
              lottieAsset: LottieManager.errorLottie,
              size: 300,
              message: state.message,
            );
          }
          if (state is JobSuccess) {
            final List<JobModel> jobs = state.job;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  OverviewSection(jobs: jobs),
                  20.verticalSpace,
                  RecentApplicationsSection(),
                  20.verticalSpace,
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
