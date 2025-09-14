import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_elevated_button.dart';
import 'package:hirely/core/common_widgets.dart/custom_text_field.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/helper/enums.dart';
import 'package:hirely/core/routing/routes.dart';
import 'package:hirely/features/add_application/presentation/widgets/job_options_row.dart';

class AddApplicationFirstPage extends StatefulWidget {
  const AddApplicationFirstPage({
    super.key,
  });

  @override
  State<AddApplicationFirstPage> createState() =>
      _AddApplicationFirstPageState();
}

class _AddApplicationFirstPageState extends State<AddApplicationFirstPage> {
  JobType selectedJobTypeItem = JobType.fullTime;
  JobMode selectedJobModeItem = JobMode.onSite;
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController postLinkController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    jobTitleController.dispose();
    companyController.dispose();
    locationController.dispose();
    postLinkController.dispose();
    dateController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20.h,
        children: [
          30.verticalSpace,
          CustomTextFormField(
              lableText: 'Job Title',
              hintText: 'Enter job title',
              controller: jobTitleController),
          CustomTextFormField(
              lableText: 'Company',
              hintText: 'Enter company name',
              controller: companyController),
          JobOptionsRow(selectedJobModeItem: (selectedItem) {
            setState(() {
              selectedJobModeItem = selectedItem;
            });
            log("selectedJobModeItem===$selectedItem");
          }, selectedJobTypeItem: (selectedItem) {
            setState(() {
              selectedJobTypeItem = selectedItem;
            });
          }),
          CustomTextFormField(
              lableText: 'Location',
              hintText: 'Enter Location',
              controller: locationController),
          CustomTextFormField(
              lableText: 'Post Link',
              hintText: "Enter post link",
              controller: postLinkController),
          20.verticalSpace,
          CustomElevatedButton(
            text: "Next",
            onPressed: () {
              context.read<JobsCubit>().saveFirstPageData(
                    title: jobTitleController.text,
                    company: companyController.text,
                    location: locationController.text,
                    jobMode: selectedJobModeItem,
                    jobType: selectedJobTypeItem,
                    postLink: postLinkController.text,
                  );

              Navigator.pushNamed(context, Routes.addApplicationSecondScreen);
            },
          ),
        ],
      ),
    );
  }
}
