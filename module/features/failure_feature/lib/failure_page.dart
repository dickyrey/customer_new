import 'package:failure_feature/widgets/failure_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FailurePage extends StatelessWidget {
  const FailurePage({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
      ),
      body: FailureBodyWidget(
        message: message,
        onPrimaryLabel: lang.back,
        onPrimaryTap: () => Navigator.pop(context),
      ),
    );
  }
}
