import 'package:flutter/material.dart';
import 'package:hirely/features/dashboard/presentation/widgets/overview_section.dart';

class DashboardScreenBody extends StatelessWidget {
  const DashboardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [OverviewSection()],
    );
  }
}
