import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/vector_constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_libraries/intl/intl.dart';
import 'package:shared_libraries/slide_countdown/slide_countdown.dart';
import 'package:shared_utilities/currency_format/currency_format_util.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';

class PaymentBodyWidget extends StatelessWidget {
  const PaymentBodyWidget({
    required this.args,
    super.key,
  });

  final TransactionDetail args;

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (args.payment.type) {
      case 'transfer':
        body = _TransferPaymentBodyWidget(args: args);
      default:
        body = const _CashPaymentBodyWidget();
    }
    return body;
  }
}

class _CashPaymentBodyWidget extends StatelessWidget {
  const _CashPaymentBodyWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        width: double.infinity,
        height: 400,
        margin: const EdgeInsets.symmetric(
          horizontal: MARGIN,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: SPACE_LARGE,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RADIUS),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AssetVectors.smiling),
                      const SizedBox(height: SPACE_VERY_LARGE),
                      Text(
                        lang.thank_you_for_purchasing_drinking_water,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: SPACE_MEDIUM),
                      Text(
                        lang.water_gallon_will_be_delivered_soon,
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN,
                ),
                child: ElevatedButtonWidget(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.transaction,
                      (route) => false,
                    );
                  },
                  label: lang.view_order,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransferPaymentBodyWidget extends StatelessWidget {
  const _TransferPaymentBodyWidget({
    required this.args,
  });

  final TransactionDetail args;

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
                      // ignore: lines_longer_than_80_chars
                      '${DateFormat.yMMMMd('id-ID').format(args.createdAt.add(const Duration(minutes: 15)))} | ${DateFormat.Hm('id-ID').format(args.createdAt.add(const Duration(minutes: 15)))} WIB',
                      style: theme.textTheme.headlineSmall,
                    ),
                    SlideCountdown(
                      duration: args.createdAt
                          .add(const Duration(minutes: 15))
                          .difference(DateTime.now()),
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(RADIUS),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: SPACE_LARGE),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: theme.primaryColor),
                //     borderRadius: BorderRadius.circular(RADIUS),
                //     color: theme.primaryColor.withOpacity(.1),
                //   ),
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: SPACE_SMALL,
                //     vertical: SPACE_TINY,
                //   ),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Icon(
                //         FeatherIcons.info,
                //         color: theme.primaryColor,
                //       ),
                //       const SizedBox(width: SPACE_SMALL),
                //       Expanded(
                //         child: Text(
                //           // ignore: lines_longer_than_80_chars
                //   lang.if_you_have_already_paid_please_upload_payment_proof,
                //           style: theme.textTheme.bodyMedium,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
          const SizedBox(height: SPACE_LARGE),
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
