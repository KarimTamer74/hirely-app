import 'package:flutter/material.dart';
import 'package:hirely/core/common_widgets.dart/custom_app_bar.dart';
import 'package:hirely/core/constants/app_constants.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/features/add_application/presentation/widgets/add_application_first_page.dart';

class AddApplicationScreen extends StatefulWidget {
  const AddApplicationScreen({super.key});

  @override
  State<AddApplicationScreen> createState() => _AddApplicationScreenState();
}

class _AddApplicationScreenState extends State<AddApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.addApplication,
      ),
      body: Padding(
        padding: AppConstants.appPadding,
        child: AddApplicationFirstPage(),
      ),
    );
  }
}
