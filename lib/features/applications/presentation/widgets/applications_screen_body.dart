import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/custom_search_text_field.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/features/applications/presentation/widgets/applications_list_view_widget.dart';

class ApplicationsScreenBody extends StatefulWidget {
  const ApplicationsScreenBody({super.key});

  @override
  State<ApplicationsScreenBody> createState() => _ApplicationsScreenBodyState();
}

class _ApplicationsScreenBodyState extends State<ApplicationsScreenBody> {
  String searched = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchTextField(
          hintText: AppStrings.search,
          onTextChanged: (String value) {
            log("Search value: $value");
            setState(() {
              searched = value;
            });
          },
        ),
        10.verticalSpace,
        ApplicationsListViewWidget(searched: searched),
      ],
    );
  }
}
