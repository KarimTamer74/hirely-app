import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hirely/core/utils/app_colors.dart';
import 'package:hirely/core/utils/app_strings.dart';
import 'package:hirely/features/dashboard/presentation/pages/dashboard_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialIndex;
  }

  final List<TabItem> _navBarItems = [
    const TabItem(
        icon: Icons.settings_applications, title: AppStrings.applications),
    const TabItem(icon: Icons.add, title: AppStrings.add),
    const TabItem(icon: Icons.dashboard, title: AppStrings.dashboard),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  List<Widget> getBottomNavigationBarBody() {
    return const [
      DashboardScreen(),
      DashboardScreen(),
      DashboardScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBottomNavigationBarBody()[_currentPageIndex],
      bottomNavigationBar: ConvexAppBar(
        key: ValueKey(_currentPageIndex),
        height: 55,
        curve: Curves.easeInOut,
        style: TabStyle.fixedCircle,
        color: AppColors.black,
        backgroundColor: AppColors.white,
        elevation: 5,
        activeColor: AppColors.primaryBlueClr,
        items: _navBarItems,
        initialActiveIndex: _currentPageIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
