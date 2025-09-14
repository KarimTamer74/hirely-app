import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/core/utils/font_manager.dart';
import 'package:hirely/core/utils/style_manager.dart';

class TagSelectionWidget extends StatefulWidget {
  const TagSelectionWidget({super.key, required this.passSelectedTag});
  final Function(String? tag) passSelectedTag;
  @override
  State<TagSelectionWidget> createState() => _TagSelectionWidgetState();
}

class _TagSelectionWidgetState extends State<TagSelectionWidget> {
  final List<String> tags = ["Tech", "Finance", "Marketing", "NGO"];
  String? selectedTag = '';

  void _toggleTag(String tag) {
    setState(() {
      if (selectedTag == tag) {
        selectedTag = null;
        widget.passSelectedTag(selectedTag);
      } else {
        selectedTag = tag;
        widget.passSelectedTag(selectedTag!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppStrings.tags,
          style: getBoldStyle(fontSize: FontSize.s18),
        ),
        10.verticalSpace,
        Wrap(
          spacing: 4,
          runSpacing: 8,
          children: tags.map((tag) {
            final isSelected = selectedTag == tag;
            return InkWell(
              onTap: () => _toggleTag(tag),
              child: CustomChipWidget(
                label: tag,
                isSelected: isSelected,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      backgroundColor: isSelected ? AppColors.bluishClr : Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? AppColors.bluishClr : Colors.grey,
        ),
      ),
    );
  }
}
