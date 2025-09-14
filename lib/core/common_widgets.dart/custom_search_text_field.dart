import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_styles.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
    required this.hintText,
    required this.onTextChanged,
  });

  final String hintText;
  final ValueChanged<String> onTextChanged;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: widget.onTextChanged,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      autocorrect: true,
      enableSuggestions: true,
      textCapitalization: TextCapitalization.sentences,
      style: AppStyles.textStyle20.copyWith(fontSize: 16.sp),
      cursorHeight: 20.h,
      cursorColor: AppColors.bluishClr,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        filled: true,
        fillColor: AppColors.greyShade100,
        hintText: widget.hintText,
        hintStyle: AppStyles.textStyle20.copyWith(
          color: AppColors.black.withOpacity(0.5),
          fontSize: 14.sp,
        ),
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  searchController.clear();
                  widget.onTextChanged('');
                  setState(() {}); // refresh suffix icon
                },
              )
            : const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bluishClr, width: 1.5),
          borderRadius: BorderRadius.circular(24.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bluishClr, width: 2),
          borderRadius: BorderRadius.circular(24.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orange, width: 1.5),
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
    );
  }
}
