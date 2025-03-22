import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    required this.onTap,
    super.key,
    this.label,
    this.labelColor,
    this.labelLoading,
    this.color,
    this.child,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 47,
    this.labelSize,
    this.margin,
    this.elevation,
  });

  final Widget? child;
  final String? label;
  final Color? labelColor;
  final String? labelLoading;
  final Color? color;
  final void Function()? onTap;
  final bool isLoading;
  final double width;
  final double height;
  final double? labelSize;
  final double? elevation;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: (isLoading == true) ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RADIUS),
          ),
          elevation: elevation,
        ),
        child: (isLoading == true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SpinKitDualRing(
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: (labelLoading == null) ? 0 : SPACE_MEDIUM),
                  Text(
                    labelLoading ?? '',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: labelSize,
                      color: labelColor ?? Colors.white,
                    ),
                  ),
                ],
              )
            : (label == '' || label == null)
                ? child
                : Text(
                    capitalizeEachWordFormat(label ?? ''),
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: labelSize,
                      color: labelColor ?? Colors.white,
                    ),
                  ),
      ),
    );
  }
}
