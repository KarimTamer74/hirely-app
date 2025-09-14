import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_app_bar.dart';
import 'package:hirely/core/common_widgets.dart/custom_date_picker.dart';
import 'package:hirely/core/common_widgets.dart/custom_elevated_button.dart';
import 'package:hirely/core/common_widgets.dart/custom_text_field.dart';
import 'package:hirely/core/common_widgets.dart/show_bottom_sheet.dart';
import 'package:hirely/core/common_widgets.dart/toast.dart';
import 'package:hirely/core/constants/app_constants.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/routing/routes.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';
import 'package:hirely/features/add_application/presentation/widgets/tag_selection_widget.dart';
import 'package:hirely/features/add_application/presentation/widgets/upload_cv_widget.dart';

class AddApplicationSecondPage extends StatefulWidget {
  const AddApplicationSecondPage({
    super.key,
  });
  @override
  State<AddApplicationSecondPage> createState() =>
      _AddApplicationSecondPageState();
}

class _AddApplicationSecondPageState extends State<AddApplicationSecondPage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  String? selectedTag = '';
  bool isLoading = false;
  @override
  void dispose() {
    dateController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void showBottomSheet() {
    showSuccessBottomSheet(
      context,
      title: 'Your Application has been created successfully!',
      message: '',
      textButton: '',
      onFirstButtonPressed: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, Routes.mainView, arguments: 0);
      },
      onSecondButtonPressed: () {
        Navigator.pushReplacementNamed(context, Routes.addApplicationScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.addApplication,
      ),
      body: SafeArea(
        child: Padding(
          padding: AppConstants.appPadding,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.h,
              children: [
                CustomDatePickerField(
                  hintText: 'Select date',
                  onChanged: (value) {
                    log("Value is $value", name: "DatePicker");
                    if (value != null) {
                      setState(() {
                        dateController.text = value;
                      });
                    }
                  },
                  controller: dateController,
                ),
                TagSelectionWidget(
                  passSelectedTag: (tag) {
                    setState(() {
                      selectedTag = tag;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Notes",
                      style: getBoldStyle(fontSize: FontSize.s18),
                    ),
                    10.verticalSpace,
                    CustomTextFormField(
                        lableText: 'Notes',
                        hintText: 'Any addational notes..',
                        maxLines: 4,
                        controller: notesController),
                  ],
                ),
                UploadCvWidget(),
                CustomElevatedButton(
                  backgroundColor: AppColors.orange,
                  text: "Back",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                BlocConsumer<JobsCubit, JobsState>(
                  listener: (context, state) {
                    if (state is JobLoading) {
                      log("Loading", name: "Job Loading State");
                      isLoading = true;
                    } else if (state is JobFailure) {
                      isLoading = false;

                      log("Failure: ${state.message}",
                          name: "Job Failure State");
                      ShowToast.showError(state.message);
                    } else if (state is JobSuccess) {
                      log("Success", name: "Job Success State");
                      isLoading = false;
                      ShowToast.showSuccess("Job Added Successfully");
                      showBottomSheet();
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text: isLoading ? "Saving..." : "Save",
                      onPressed: () {
                        context.read<JobsCubit>().insertJob(
                              date: dateController.text.isNotEmpty
                                  ? DateTime.tryParse(dateController.text)
                                  : null,
                              notes: notesController.text,
                              tags: selectedTag,
                              cvUrl: "uploaded_cv_url.pdf",
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
