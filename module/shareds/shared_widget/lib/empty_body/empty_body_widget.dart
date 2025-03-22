import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/vector_constants.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';

enum EmptyBodyType {
  address,
  error,
  notification,
  submission,
  transaction,
  unauthenticated,
}

class EmptyBodyWidget extends StatelessWidget {
  const EmptyBodyWidget({
    required this.type,
    this.onTap,
    super.key,
  });

  final EmptyBodyType type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    Widget body;

    switch (type) {
      case EmptyBodyType.address:
        body = _EmptyBodyWidget(
          illustration: AssetVectors.empty,
          title: lang.empty_address_title,
          subtitle: lang.empty_address_subtitle,
          labelButton: lang.add_address,
          onTap: onTap,
        );
      case EmptyBodyType.error:
        body = _EmptyBodyWidget(
          illustration: AssetVectors.error,
          title: lang.empty_error_title,
          subtitle: lang.empty_error_subtitle,
          labelButton: '',
          onTap: onTap,
        );
      case EmptyBodyType.notification:
        body = _EmptyBodyWidget(
          illustration: AssetVectors.notification,
          title: lang.empty_notification_title,
          subtitle: lang.empty_notification_subtitle,
          labelButton: '',
          onTap: onTap,
        );
      case EmptyBodyType.submission:
        body = _EmptyBodyWidget(
          illustration: AssetVectors.empty,
          title: lang.empty_submission_title,
          subtitle: lang.empty_submission_subtitle,
          labelButton: '',
          onTap: onTap,
        );
      case EmptyBodyType.transaction:
        body = _EmptyBodyWidget(
          illustration: AssetVectors.transaction,
          title: lang.empty_transaction_title,
          subtitle: lang.empty_transaction_subtitle,
          labelButton: '',
          onTap: onTap,
        );
      case EmptyBodyType.unauthenticated:
        body = _EmptyBodyWidget(
          illustration: AssetVectors.error,
          title: lang.empty_authentication_title,
          subtitle: lang.empty_authentication_subtitle,
          labelButton: lang.login,
          onTap: onTap,
        );
    }

    return body;
  }
}

class _EmptyBodyWidget extends StatelessWidget {
  const _EmptyBodyWidget({
    required this.illustration,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.labelButton,
  });

  final String illustration;
  final String title;
  final String subtitle;

  // Button (optional)
  final VoidCallback? onTap;
  final String? labelButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN,
        vertical: MARGIN,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              illustration,
              width: 150,
            ),
          ),
          const SizedBox(height: SPACE_LARGE),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: SPACE_MEDIUM),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: SPACE_MEDIUM),
          Visibility(
            visible: onTap != null,
            child: ElevatedButtonWidget(
              onTap: onTap,
              label: labelButton,
            ),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
