import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/toast.dart';
import 'package:hirely/core/data/services_locator/services_locator.dart';
import 'package:hirely/core/theme/app_colors.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadCvWidget extends StatefulWidget {
  const UploadCvWidget({super.key});

  @override
  State<UploadCvWidget> createState() => _UploadCvWidgetState();
}

class _UploadCvWidgetState extends State<UploadCvWidget> {
  String? fileName;
  String? fileUrl;
  bool isLoading = false;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      // check size (max 5MB)
      if (file.size > 5 * 1024 * 1024) {
        ShowToast.show("File too large! Max 5MB");
        return;
      }

      setState(() {
        isLoading = true;
      });

      try {
        final supabase = sl<SupabaseClient>();

        final path =
            "cvs/${DateTime.now().millisecondsSinceEpoch}_${file.name}";

        await supabase.storage.from("cv-bucket").upload(
              path,
              File(file.path!),
            );

        // Get public URL
        final url = supabase.storage.from("cv-bucket").getPublicUrl(path);

        setState(() {
          fileName = file.name;
          fileUrl = url;
        });

        ShowToast.showSuccess("File uploaded successfully");
      } catch (e) {
        ShowToast.showError("Upload failed: $e");
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _openFile() async {
    if (fileUrl != null) {
      final Uri uri = Uri.parse(fileUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ShowToast.showError("Could not open file");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload CV",
          style: getBoldStyle(fontSize: FontSize.s18),
        ),
        10.verticalSpace,
        InkWell(
          onTap: fileUrl == null ? _pickFile : _openFile,
          child: Container(
            width: double.infinity,
            height: 150.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColor.black),
            ),
            child: isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        fileUrl == null
                            ? Icons.cloud_upload
                            : Icons.insert_drive_file,
                        size: 28.sp,
                        color: fileUrl == null ? Colors.black : Colors.green,
                      ),
                      10.verticalSpace,
                      fileUrl == null
                          ? RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Click to upload',
                                  style: getMediumStyle(
                                    fontSize: FontSize.s15,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                TextSpan(
                                  text: '  PDF, DOCX (max 5MB)',
                                  style: getRegularStyle(
                                    fontSize: FontSize.s14,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ]),
                            )
                          : Text(
                              fileName!,
                              style: getMediumStyle(
                                fontSize: FontSize.s15,
                                color: Colors.green,
                              ),
                            ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
