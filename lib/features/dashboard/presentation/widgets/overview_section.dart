import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/app_styles.dart';
import 'package:hirely/features/dashboard/presentation/widgets/application_status_card_widget.dart';
import 'package:hirely/features/dashboard/presentation/widgets/total_applications_card_widget.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.overview,
          style: AppStyles.textStyleBold22,
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: TotalApplicationsCardWidget()),
              12.horizontalSpace,
              Expanded(child: ApplicationStatusCardWidget()),
            ],
          ),
        )
      ],
    );
  }
}
