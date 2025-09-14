import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hirely/core/utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const CustomLoadingIndicator({
    super.key,
    this.size = 60,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        size: size,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: color ??
                  (index.isEven
                      ? AppColors.orange
                      : AppColors.bottomNavBarColor),
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
