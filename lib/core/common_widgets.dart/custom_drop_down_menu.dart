import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key,
      required this.entries,
      required this.selectedItem,
      required this.label});
  final List<DropdownMenuEntry> entries;
  final Function(dynamic) selectedItem;
  final String label;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      textStyle: TextStyle(),
      onSelected: (value) {
        selectedItem(value);
      },
      // menuStyle: MenuStyle(),
      // initialSelection: JobType.partTime,
      hintText: 'Select', label: Text(label),
      enableFilter: true,
      enableSearch: true,
      searchCallback: (entries, query) {
        return null;
      },
      keyboardType: TextInputType.numberWithOptions(),
      width: double.infinity,
      dropdownMenuEntries: entries,
    );
  }
}
