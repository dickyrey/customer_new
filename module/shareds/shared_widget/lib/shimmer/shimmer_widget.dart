import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shimmer.fromColors(
      baseColor: theme.dividerColor,
      highlightColor: theme.colorScheme.surface.withValues(alpha: .1),
      child: child,
    );
  }
}

class ShimmerContainerWidget extends StatelessWidget {
  const ShimmerContainerWidget({
    super.key,
    this.width = 100,
    this.height = 10,
  });

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.hintColor,
        borderRadius: BorderRadius.circular(RADIUS),
      ),
    );
  }
}
