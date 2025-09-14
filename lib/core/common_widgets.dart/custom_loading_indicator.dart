import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;
  final bool showBackground;

  const CustomLoadingIndicator({
    super.key,
    this.size = 60,
    this.color,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: showBackground
            ? BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              )
            : null,
        child: SpinKitFadingCircle(
          size: size,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: color ??
                    (index.isEven
                        ? theme.colorScheme.primary
                        : theme.colorScheme.secondary),
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }
}
