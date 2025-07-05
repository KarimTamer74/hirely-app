import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });
  final String? title;
  final Widget? leading;
  final Widget? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? '', style: AppStyles.textStyleBold20),
      centerTitle: true,
      // leading: leading ??
      //     IconButton(
      //         padding: EdgeInsets.only(left: 10),
      //         onPressed: () {
      //           // context.isDarkMode
      //           //     ? BlocProvider.of<ThemeCubit>(context)
      //           //         .changeTheme(ThemeMode.light)
      //           //     : BlocProvider.of<ThemeCubit>(context)
      //           //         .changeTheme(ThemeMode.dark);
      //         },
      //         style: IconButton.styleFrom(),
      //         icon: Icon(
      //           context.isDarkMode
      //               ? Icons.dark_mode_outlined
      //               : Icons.light_mode_outlined,
      //           size: 30.sp,
      //         )),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 10.0),
      //     child: actions ??
      //         CircleAvatar(
      //           backgroundImage: AssetImage(AppImages.userPhoto),
      //           backgroundColor: AppColors.white,
      //           radius: 20.r,
      //         ),
      //   )
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0.h);
}
