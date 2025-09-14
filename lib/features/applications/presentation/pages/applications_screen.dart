import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hirely/core/common_widgets.dart/custom_app_bar.dart';
import 'package:hirely/core/constants/app_constants.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/data/repo/repo_impl.dart';
import 'package:hirely/core/data/services_locator/services_locator.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/features/applications/presentation/widgets/applications_screen_body.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: JobsCubit(sl<RepoImplementation>())..fetchJobs(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.applications,
        ),
        body: Padding(
            padding: AppConstants.appPadding, child: ApplicationsScreenBody()),
      ),
    );
  }
}
