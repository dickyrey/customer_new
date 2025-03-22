import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:payment_feature/pages/widgets/payment_body_widget.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({required this.args, super.key});

  final TransactionDetail args;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final bool _willPop = false;
  Future<bool> _willPopCallback(
    BuildContext context, {
    required bool didPop,
  }) async {
    final lang = AppLocalizations.of(context)!;

    if (!didPop) {
      await showConfirmationDialog(
        context,
        title: lang.are_you_sure_leave_payment_page,
        primaryButtonLabel: lang.yes,
        onPrimaryButtonTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.dashboard,
            (route) => false,
          );
        },
      );
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return PopScope(
      canPop: _willPop,
      onPopInvokedWithResult: (v, result) =>
          _willPopCallback(context, didPop: v),
      child: Scaffold(
        appBar: widget.args.payment.type == 'transfer'
            ? AppBar(
                backgroundColor: theme.cardColor,
                title: Text(
                  lang.payment,
                  style: theme.textTheme.headlineMedium,
                ),
              )
            : null,
        body: PaymentBodyWidget(
          args: widget.args,
        ),
      ),
    );
  }
}
