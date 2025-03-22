import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/icon_constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_utilities/currency_format/currency_format_util.dart';
import 'package:transaction_core/domain/entities/transaction.dart';

class TransactionOverviewCardWidget extends StatelessWidget {
  const TransactionOverviewCardWidget({
    required this.data,
    super.key,
  });

  final Transaction data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String statusLabel(String v) {
      switch (v) {
        case 'pending':
          return lang.transaction_status_pending;
        case 'waiting':
          return lang.transaction_status_waiting;
        case 'delivery':
          return lang.transaction_status_delivery;
        case 'success':
          return lang.transaction_status_success;
        case 'failed':
          return lang.transaction_status_failed;

        default:
          return lang.transaction_status_failed;
      }
    }

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RADIUS),
      ),
      margin: const EdgeInsets.only(bottom: SPACE_MEDIUM),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.transactionDetail,
            arguments: data.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SPACE_SMALL,
            vertical: SPACE_TINY,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID: ${data.id}',
                    style: theme.textTheme.headlineSmall,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SPACE_TINY,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    child: Text(
                      statusLabel(data.status).toUpperCase(),
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SPACE_SMALL),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 100,
                    child: SvgPicture.asset(
                      AssetIcons.gallon,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SPACE_MEDIUM,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${lang.amount} :',
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                // ignore: lines_longer_than_80_chars
                                '${data.productList.first.amount} ${lang.galon}',
                                style: theme.textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: SPACE_SMALL),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${lang.total} :',
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                currencyFormat(data.total),
                                style: theme.textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SPACE_SMALL),
              Visibility(
                visible: data.isReviewed && data.status == 'success',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        lang.earn_points_with_reviews,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.review,
                          arguments: data.id,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SPACE_LARGE,
                          vertical: SPACE_TINY - 3,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.primaryColor),
                          borderRadius: BorderRadius.circular(RADIUS),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          lang.rate,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
