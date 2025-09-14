import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/features/dashboard/presentation/widgets/recent_applications_card_item.dart';

class RecentApplicationsListView extends StatelessWidget {
  const RecentApplicationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        if (state is GetRecentJobsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetRecentJobsFailure) {
          log(state.message);
          return Center(child: Text(state.message));
        }

        if (state is GetRecentJobsSuccess) {
          log("Recent Jobs: ${state.recentJobs.length}");
          final recentJobs = state.recentJobs;

          if (recentJobs.isEmpty) {
            return const Center(child: Text("No applications found"));
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: recentJobs.length,
            itemBuilder: (context, index) {
              return RecentApplicationsCardItem(
                application: recentJobs[index],
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
