import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_drop_down_menu.dart';
import 'package:hirely/core/helper/enums.dart';

class JobOptionsRow extends StatelessWidget {
  const JobOptionsRow({
    super.key,
    required this.selectedJobModeItem,
    required this.selectedJobTypeItem,
  });
  final Function(dynamic) selectedJobModeItem;
  final Function(dynamic) selectedJobTypeItem;

  static List<DropdownMenuEntry> jobTypeEntries = [
    DropdownMenuEntry(value: JobType.fullTime, label: 'Full Time'),
    DropdownMenuEntry(value: JobType.partTime, label: 'Part Time'),
    DropdownMenuEntry(value: JobType.intern, label: 'Internship'),
    DropdownMenuEntry(value: JobType.freelance, label: 'Freelance')
  ];
  static List<DropdownMenuEntry> jobModeEntries = [
    DropdownMenuEntry(value: JobMode.onSite, label: 'OnSite'),
    DropdownMenuEntry(value: JobMode.remote, label: 'Remotely'),
    DropdownMenuEntry(value: JobMode.hybrid, label: 'Hybrid'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropDownMenu(
            label: 'Job Type',
            entries: jobTypeEntries,
            selectedItem: (selectedItem) {
              selectedJobTypeItem(selectedItem);

              log("selectedJobTypeItem===$selectedItem");
            },
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: CustomDropDownMenu(
            label: 'Job Mode',
            entries: jobModeEntries,
            selectedItem: (selectedItem) {
              selectedJobModeItem(selectedItem);
              log("selectedJobModeItem===$selectedItem");
            },
          ),
        ),

        // CustomDropDownTextField()
      ],
    );
  }
}
