import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:deposit_feature/pages/deposit_payment/widgets/deposit_payment_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DepositPaymentPage extends StatelessWidget {
  const DepositPaymentPage({required this.args, super.key});

  final DepositDetail args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.cardColor,
        title: Text(
          lang.payment,
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: DepositPaymentBodyWidget(
        args: args,
      ),
    );
  }
}
