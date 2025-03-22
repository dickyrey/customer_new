import 'package:deposit_core/domain/entities/deposit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/timeago/timeago.dart' as timeago;
import 'package:shared_utilities/currency_format/currency_format_util.dart';

class DepositOverviewCard extends StatelessWidget {
  const DepositOverviewCard({
    required this.data,
    super.key,
  });

  final Deposit data;

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

    Color statusColor(String v) {
      switch (v) {
        case 'pending':
          return const Color(0xFFCBA92B);
        case 'success':
          return const Color(0xFF077E8C);
        case 'failed':
          return const Color(0xFFD9512C);
        default:
          return const Color(0xFFD9512C);
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: SPACE_MEDIUM),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.depositDetail,
            arguments: data.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SPACE_SMALL,
            vertical: SPACE_TINY,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SPACE_TINY,
                        vertical: SPACE_TINY - 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(RADIUS),
                        color: statusColor(data.status),
                      ),
                      child: Text(
                        statusTitle(data.status),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: SPACE_SMALL),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${lang.deposit}: ',
                            style: theme.textTheme.titleLarge,
                          ),
                          TextSpan(
                            text: currencyFormat(data.total),
                            style: theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                timeago.format(data.createdAt),
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
