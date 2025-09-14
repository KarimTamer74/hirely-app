import 'package:flutter/material.dart';
import 'package:hirely/core/helper/enums.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';

Color getApplicationStatusColor(ApplicationStatus status) {
  switch (status) {
    case ApplicationStatus.pending:
      return AppColors.orange;
    case ApplicationStatus.accepted:
      return AppColors.green;
    case ApplicationStatus.rejected:
      return AppColors.red;
  }
}
String getApplicationStatusText(ApplicationStatus status) {
  switch (status) {
    case ApplicationStatus.pending:
      return AppStrings.pending;
    case ApplicationStatus.accepted:
      return AppStrings.accepted;
    case ApplicationStatus.rejected:
      return AppStrings.rejected;
  }
}

String getJobType(JobType type) {
  switch (type) {
    case JobType.fullTime:
      return AppStrings.fullTime;
    case JobType.partTime:
      return AppStrings.partTime;
    case JobType.freelance:
      return AppStrings.freelance;
    case JobType.intern:
      return AppStrings.internship;
  }
}
String getJobMode(JobMode mode) {
  switch (mode) {
    case JobMode.hybrid:
      return AppStrings.hybrid;
    case JobMode.remote:
      return AppStrings.remote;
    case JobMode.onSite:
      return AppStrings.onSite;
  }
}
String formatDate(String dateString) {
  DateTime parsedDate = DateTime.parse(dateString);
  return "${parsedDate.day.toString().padLeft(2, '0')}-"
         "${parsedDate.month.toString().padLeft(2, '0')}-"
         "${parsedDate.year}";
}
