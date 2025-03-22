import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';

Future<dynamic> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String primaryButtonLabel,
  required VoidCallback onPrimaryButtonTap,
  String? secondaryButtonLabel,
  bool barrierDismissible = false,
  VoidCallback? onSecondaryButtonTap,
  Color? buttonColor,
}) {
  final theme = Theme.of(context);
  final lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return AlertDialog(
        backgroundColor: theme.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SPACE_VERY_LARGE),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButtonWidget(
                        onTap: (onSecondaryButtonTap == null)
                            ? () => Navigator.pop(context)
                            : onSecondaryButtonTap,
                        label: (secondaryButtonLabel == null)
                            ? lang.cancel
                            : secondaryButtonLabel,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButtonWidget(
                        onTap: onPrimaryButtonTap,
                        label: primaryButtonLabel,
                        color: buttonColor ?? theme.primaryColor,
                        labelSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
