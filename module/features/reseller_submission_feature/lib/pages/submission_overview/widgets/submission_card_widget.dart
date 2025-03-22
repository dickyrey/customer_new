import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseller_core/domain/entities/submission.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/intl/intl.dart';

class SubmissionCardWidget extends StatelessWidget {
  const SubmissionCardWidget({
    required this.data,
    super.key,
  });

  final Submission data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String status(String v) {
      switch (v) {
        case '2':
          return lang.submission_status_pending;
        case '1':
          return lang.submission_status_success;
        case '0':
          return lang.submission_status_failed;
        default:
          return lang.submission_status_pending;
      }
    }

    Color statusColor(String v) {
      switch (v) {
        case '2':
          return const Color(0xFFCBA92B);
        case '1':
          return const Color(0xFF077E8C);
        case '0':
          return const Color(0xFFD9512C);
        default:
          return const Color(0xFFD9512C);
      }
    }

    return Card(
      margin: const EdgeInsets.only(
        bottom: SPACE_SMALL,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SPACE_TINY,
          vertical: SPACE_TINY - 3,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.submissionDetail,
              arguments: data.id,
            );
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '#${data.id}',
                    style: theme.textTheme.headlineSmall,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor(data.status),
                      borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: SPACE_TINY,
                      vertical: SPACE_TINY - 3,
                    ),
                    child: Text(
                      status(data.status),
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SPACE_SMALL),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    FeatherIcons.home,
                    color: theme.textTheme.bodyLarge?.color,
                    size: 20,
                  ),
                  const SizedBox(width: SPACE_SMALL),
                  Text(
                    data.store,
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: SPACE_TINY),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    FeatherIcons.clock,
                    color: theme.textTheme.bodyLarge?.color,
                    size: 20,
                  ),
                  const SizedBox(width: SPACE_SMALL),
                  Text(
                    DateFormat.yMMMMEEEEd('id-ID').format(data.createdAt),
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
