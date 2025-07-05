import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hirely/core/common_widgets.dart/custom_app_bar.dart';
import 'package:hirely/core/constants/app_constants.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/features/dashboard/presentation/widgets/dashboard_screen_body.dart';

import '../cubit/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.dashboard,
        ),
        body: Padding(
          padding: AppConstants.appPadding,
          child: DashboardScreenBody(),
        ),
      ),
    );
  }
}
