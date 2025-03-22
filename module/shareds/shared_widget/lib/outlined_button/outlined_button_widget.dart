import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    required this.onTap,
    this.label,
    super.key,
    this.width = double.infinity,
    this.height = 47,
    this.labelSize,
    this.margin,
    this.isLoading = false,
    this.borderColor,
    this.labelColor,
    this.backgroundColor,
    this.icon,
    this.child,
  });

  final double width;
  final double height;
  final double? labelSize;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final bool isLoading;
  final Color? borderColor;
  final Color? labelColor;
  final Color? backgroundColor;
  final String? label;
  final Icon? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RADIUS),
          ),
          side: BorderSide(
            color: borderColor ?? theme.primaryColor,
          ),
        ),
        onPressed: (isLoading == true) ? () {} : onTap,
        child: (child != null)
            ? child
            : (icon != null)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      const SizedBox(width: SPACE_TINY),
                      Text(
                        label ?? '',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: (labelColor == null)
                              ? theme.primaryColor
                              : labelColor,
                          fontSize: labelSize,
                        ),
                      ),
                    ],
                  )
                : Text(
                    label ?? '',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: (labelColor == null)
                          ? theme.primaryColor
                          : labelColor,
                      fontSize: labelSize,
                    ),
                  ),
      ),
    );
  }
}
