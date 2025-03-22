import 'package:deposit_feature/bloc/deposit_cancel_actor/deposit_cancel_actor_bloc.dart';
import 'package:deposit_feature/bloc/deposit_detail_watcher/deposit_detail_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/intl/intl.dart';
import 'package:shared_utilities/currency_format/currency_format_util.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';

class DepositDetailBodyWidget extends StatelessWidget {
  const DepositDetailBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String statusTitle(String v) {
      switch (v) {
        case 'pending':
          return lang.deposit_status_pending;
        case 'success':
          return lang.deposit_status_success;
        case 'failed':
          return lang.deposit_status_failed;
        default:
          return lang.deposit_status_failed;
      }
    }

    return BlocBuilder<DepositDetailWatcherBloc, DepositDetailWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.deposit_details,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  _ListTile(
                    title: lang.transaction_id,
                    trailing: state.deposit.id.toString(),
                  ),
                  _ListTile(
                    title: lang.transaction_status,
                    trailing: statusTitle(state.deposit.status),
                  ),
                  _ListTile(
                    title: lang.order_date,
                    trailing: DateFormat.yMMMMEEEEd('id-ID')
                        .format(state.deposit.createdAt),
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(RADIUS),
                      border: Border.all(
                        color: theme.hintColor,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: SPACE_MEDIUM,
                      vertical: SPACE_TINY,
                    ),
                    child: Column(
                      children: [
                        _ListTile(
                          title: lang.payment_method,
                          trailing: state.deposit.payment.name,
                        ),
                        const Divider(thickness: 1.5),
                        _ListTile(
                          title:
                              '${currencyFormat(state.deposit.amount)} Deposit',
                          currency: state.deposit.amount,
                        ),
                        const Divider(thickness: 1.5),
                        _ListTile(
                          title: lang.total,
                          currency: state.deposit.amount,
                        ),
                        _ListTile(
                          title: lang.unique_code,
                          currency: state.deposit.uniqueCode,
                        ),
                        _ListTile(
                          title: lang.total_payment,
                          currency: state.deposit.total,
                          isBoldText: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACE_VERY_LARGE),
                  Visibility(
                    visible: state.deposit.status == 'pending',
                    child: ElevatedButtonWidget(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.depositPayment,
                          arguments: state.deposit,
                        );
                      },
                      label: lang.pay_now,
                    ),
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Visibility(
                    visible: state.deposit.status == 'pending',
                    child: OutlinedButtonWidget(
                      onTap: () {
                        showConfirmationDialog(
                          context,
                          title: lang.are_you_sure_cancel_this_transaction,
                          primaryButtonLabel: lang.yes,
                          onPrimaryButtonTap: () {
                            context.read<DepositCancelActorBloc>().add(
                                  DepositCancelActorEvent.delete(
                                    state.deposit.id,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                        );
                      },
                      label: lang.cancel_transaction,
                      borderColor: theme.colorScheme.error,
                      labelColor: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.title,
    this.trailing = '',
    this.currency = 0,
    this.isBoldText = false,
  });

  final String title;
  final String trailing;
  final int currency;
  final bool isBoldText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SPACE_TINY,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: isBoldText ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            currency != 0 ? currencyFormat(currency) : trailing,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: isBoldText ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
