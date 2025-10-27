import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/applications_card_item.dart';
import 'package:hirely/core/common_widgets.dart/custom_error_widget.dart';
import 'package:hirely/core/common_widgets.dart/custom_loading_indicator.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';
import 'package:hirely/core/utils/app_strings.dart';

class ApplicationsListViewWidget extends StatelessWidget {
  const ApplicationsListViewWidget({
    super.key,
    required this.searched,
  });

  final String searched;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) {
          if (state is JobLoading) {
            return const CustomLoadingIndicator();
          } else if (state is JobFailure) {
            return CustomErrorWidget(
              message: state.message,
              onRetry: () {
                context.read<JobsCubit>().fetchJobs();
              },
            );
          } else if (state is JobSuccess) {
            final jobs = state.job;

            if (jobs.isEmpty) {
              return CustomErrorWidget(
                message: AppStrings.noApplicationsAvaliable,
              );
            }

            List<JobModel> filteredJobs = getFilteredJobs(jobs);

            if (filteredJobs.isEmpty) {
              return CustomErrorWidget(
                message: AppStrings.noResultsMatch,
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView.separated(
                itemCount: filteredJobs.length,
                separatorBuilder: (_, __) => 10.verticalSpace,
                itemBuilder: (context, index) {
                  final job = filteredJobs[index];
                  log("Displaying job: ${job.toJson()}");
                  return ApplicationsCardItem(application: job);
                },
              ),
            );
          } else {
            return CustomErrorWidget(
              message: AppStrings.noApplicationsAvaliable,
            );
          }
        },
      ),
    );
  }

  List<JobModel> getFilteredJobs(List<JobModel> jobs) {
    final filteredJobs = jobs.where((job) {
      final query = searched.toLowerCase();
      return (job.title).toLowerCase().contains(query);
    }).toList();
    return filteredJobs;
  }
}
