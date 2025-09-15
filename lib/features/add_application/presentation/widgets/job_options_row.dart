import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_drop_down_text_field.dart';
import 'package:hirely/core/helper/enums.dart';
import 'package:hirely/core/utils/app_strings.dart';

class JobOptionsRow extends StatefulWidget {
  const JobOptionsRow({
    super.key,
    required this.selectedJobModeItem,
    required this.selectedJobTypeItem,
  });

  final Function(dynamic) selectedJobModeItem;
  final Function(dynamic) selectedJobTypeItem;

  @override
  State<JobOptionsRow> createState() => _JobOptionsRowState();
}

class _JobOptionsRowState extends State<JobOptionsRow> {
  dynamic _selectedJobType;
  dynamic _selectedJobMode;

  static List<DropdownMenuItem> jobTypeItems = [
    DropdownMenuItem(value: JobType.fullTime, child: Text('Full Time')),
    DropdownMenuItem(value: JobType.partTime, child: Text('Part Time')),
    DropdownMenuItem(value: JobType.intern, child: Text('Internship')),
    DropdownMenuItem(value: JobType.freelance, child: Text('Freelance')),
  ];

  static List<DropdownMenuItem> jobModeItems = [
    DropdownMenuItem(value: JobMode.onSite, child: Text('OnSite')),
    DropdownMenuItem(value: JobMode.remote, child: Text('Remotely')),
    DropdownMenuItem(value: JobMode.hybrid, child: Text('Hybrid')),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropDownTextField(
            items: jobTypeItems,
            value: _selectedJobType,
            hintText: AppStrings.jobType,
            selectedItem: (value) {
              setState(() {
                _selectedJobType = value;
              });
              widget.selectedJobTypeItem(value);
              log("selectedJobType===$value");
            },
          ),
        ),

        10.horizontalSpace,

        Expanded(
          child: CustomDropDownTextField(
            items: jobModeItems,
            value: _selectedJobMode,
            hintText: AppStrings.jobMode,
            selectedItem: (value) {
              setState(() {
                _selectedJobMode = value;
              });
              widget.selectedJobModeItem(value);
              log("selectedJobMode===$value");
            },
          ),
        ),
      ],
    );
  }
}
