import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_libraries/intl/intl.dart';
import 'package:shared_utilities/currency_format/currency_format_util.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';

class DepositPaymentBodyWidget extends StatelessWidget {
  const DepositPaymentBodyWidget({
    required this.args,
    super.key,
  });

  final DepositDetail args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN,
              vertical: SPACE_MEDIUM,
            ),
            color: theme.cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang.make_payment_before,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //
                      // ignore: lines_longer_than_80_chars
                      '${DateFormat.yMMMMd('id-ID').format(args.createdAt.add(const Duration(days: 1)))} | ${DateFormat.Hm('id-ID').format(args.createdAt.add(const Duration(days: 1)))} WIB',
                      style: theme.textTheme.headlineSmall,
                    ),

                    // CountdownTimer(
                    //   endTime:
                    //       args.createdAt.microsecondsSinceEpoch + 1000 * 30,
                    //   textStyle: theme.textTheme.headlineSmall?.copyWith(
                    //     color: theme.primaryColor,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: SPACE_MEDIUM),
          Container(
            color: theme.cardColor,
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN,
              vertical: SPACE_MEDIUM,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang.payment_method,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Row(
                  children: [
                    SvgPicture.network(
                      args.payment.image,
                      width: 70,
                    ),
                    const SizedBox(width: SPACE_MEDIUM),
                    Text(
                      args.payment.name.toUpperCase(),
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: SPACE_MEDIUM),
                _CustomListTile(
                  data: args.payment.bankAccount,
                  title: lang.account_number,
                  onTap: () {
                    showToast(msg: lang.successfully_copied);
                  },
                ),
                const SizedBox(height: SPACE_TINY),
                const Divider(thickness: 2),
                const SizedBox(height: SPACE_TINY - 3),
                _CustomListTile(
                  currency: args.total,
                  title: lang.total_payment,
                  onTap: () {
                    showToast(msg: lang.successfully_copied);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: SPACE_VERY_LARGE),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN,
            ),
            child: Text(
              lang.order_status_automatically_successful_if_payment_successful,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: SPACE_MEDIUM),
          OutlinedButtonWidget(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.dashboard,
                (route) => false,
              );
            },
            label: lang.do_later,
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.title,
    required this.onTap,
    this.data = '',
    this.currency = 0,
  });

  final String data;
  final int currency;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: SPACE_SMALL),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currency != 0 ? currencyFormat(currency) : data,
              style: theme.textTheme.labelLarge,
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                lang.copy,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
