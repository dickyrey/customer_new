import 'package:address_core/domain/entities/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';

class SubmissionAddressCardWidget extends StatelessWidget {
  const SubmissionAddressCardWidget({
    required this.data,
    required this.onTap,
    super.key,
  });

  final Address data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String addressType(String v) {
      switch (v) {
        case 'home':
          return lang.home;
        case 'office':
          return lang.office;
        case 'outlet':
          return lang.outlet;
        case 'etc':
          return lang.etc;
        default:
          return lang.etc;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: SPACE_SMALL),
      color: theme.cardColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SPACE_SMALL,
            vertical: SPACE_TINY,
          ),
          child: Row(
            children: [
              const SizedBox(width: SPACE_MEDIUM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${data.name} (+${data.phone})',
                      style: theme.textTheme.labelLarge?.copyWith(),
                    ),
                    const SizedBox(height: SPACE_TINY),
                    Text(
                      data.address,
                      style: theme.textTheme.bodyLarge?.copyWith(),
                    ),
                    const SizedBox(height: SPACE_SMALL),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(RADIUS),
                        color: theme.primaryColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: SPACE_TINY,
                        vertical: SPACE_TINY - 3,
                      ),
                      child: Text(
                        addressType(data.type),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
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
