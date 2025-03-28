import 'package:flutter/material.dart';
import 'package:shared_common/colors.dart';
import 'package:shared_common/enums.dart';

SnackBar showSnackbar(
  BuildContext context, {
  required SnackbarType type,
  required String labelText,
  required String labelButton,
  required VoidCallback onTap,
}) {
  final theme = Theme.of(context);
  Color backgroundColor;

  switch (type) {
    case SnackbarType.error:
      backgroundColor = ColorLight.error;
    case SnackbarType.info:
      backgroundColor = ColorLight.info;
    case SnackbarType.success:
      backgroundColor = ColorLight.success;
  }

  return SnackBar(
    content: Text(
      labelText,
      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
    ),
    backgroundColor: backgroundColor,
    action: SnackBarAction(
      textColor: Colors.white,
      label: labelButton,
      onPressed: onTap,
    ),
  );
}
