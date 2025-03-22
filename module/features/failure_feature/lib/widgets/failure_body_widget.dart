import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/vector_constants.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_libraries/url_launcher/url_launcher.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';

class FailureBodyWidget extends StatelessWidget {
  const FailureBodyWidget({
    required this.message,
    required this.onPrimaryLabel,
    required this.onPrimaryTap,
    super.key,
  });

  final String message;
  final String onPrimaryLabel;
  final VoidCallback onPrimaryTap;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    ExceptionType exceptionType;
    Widget body;

    /// Convert String [message] to enum [ExceptionType]
    switch (message) {
      case INTERNAL_SERVER_ERROR:
        exceptionType = ExceptionType.internal_server_error;
      case INTERNET_NOT_CONNECTED:
        exceptionType = ExceptionType.internet_not_connected;
      case INVALID_KEY:
        exceptionType = ExceptionType.invalid_key;
      case UPDATE_REQUIRED:
        exceptionType = ExceptionType.update_required;
      default:
        exceptionType = ExceptionType.other;
    }

    /// Convert enum [ExceptionType] to [FailureBodyWidget] body
    switch (exceptionType) {
      case ExceptionType.other:
        body = _FailureDisplayBodyWidget(
          svgPicture: AssetVectors.error,
          title: '${lang.unexpected_error} $message',
          subtitle: lang.unexpected_error_subtitle,
          useContactService: true,
          onPrimaryLabel: lang.back_to_home,
          onPrimaryTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.dashboard,
              (route) => false,
            );
          },
        );
      case ExceptionType.internal_server_error:
        body = _FailureDisplayBodyWidget(
          svgPicture: AssetVectors.error,
          title: lang.internal_server_error,
          subtitle: lang.internal_server_error_subtitle,
          useContactService: true,
          onPrimaryLabel: lang.back_to_home,
          onPrimaryTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.dashboard,
              (route) => false,
            );
          },
        );
      case ExceptionType.internet_not_connected:
        body = _FailureDisplayBodyWidget(
          svgPicture: AssetVectors.error,
          title: lang.internet_not_connected,
          subtitle: lang.internet_not_connected_subtitle,
          useSecondaryButton: true,
          onPrimaryLabel: onPrimaryLabel,
          onPrimaryTap: onPrimaryTap,
        );
      case ExceptionType.invalid_key:
        body = _FailureDisplayBodyWidget(
          svgPicture: AssetVectors.error,
          title: lang.invalid_app_key,
          subtitle: lang.invalid_app_key_subtitle,
          useContactService: true,
          onPrimaryLabel: lang.update_app,
          onPrimaryTap: () {
            // StoreRedirect.redirect(
            //   androidAppId: PACKAGE_NAME,
            // );
          },
        );
      case ExceptionType.update_required:
        body = _FailureDisplayBodyWidget(
          svgPicture: AssetVectors.error,
          title: lang.latest_version_available,
          subtitle: lang.latest_version_available_subtitle,
          useContactService: true,
          onPrimaryLabel: lang.update_app,
          onPrimaryTap: () {
            // StoreRedirect.redirect(
            //   androidAppId: PACKAGE_NAME,
            // );
          },
        );
    }

    return body;
  }
}

class _FailureDisplayBodyWidget extends StatelessWidget {
  const _FailureDisplayBodyWidget({
    required this.svgPicture,
    required this.title,
    required this.subtitle,
    required this.onPrimaryLabel,
    this.onPrimaryTap,
    this.useSecondaryButton = false,
    this.useContactService = false,
  });

  final String svgPicture;
  final String title;
  final String subtitle;
  final String onPrimaryLabel;
  final VoidCallback? onPrimaryTap;
  final bool useSecondaryButton;
  final bool useContactService;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(MARGIN),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 4, child: SvgPicture.asset(svgPicture)),
          const SizedBox(height: SPACE_LARGE),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: SPACE_VERY_LARGE),
                ElevatedButtonWidget(
                  onTap: onPrimaryTap,
                  label: onPrimaryLabel,
                ),
                Visibility(
                  visible: useSecondaryButton,
                  child: const SizedBox(height: SPACE_SMALL),
                ),
                Visibility(
                  visible: useSecondaryButton,
                  child: OutlinedButtonWidget(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.dashboard,
                      (route) => false,
                    ),
                    label: lang.back_to_home,
                  ),
                ),
                Visibility(
                  visible: useContactService,
                  child: const SizedBox(height: SPACE_SMALL),
                ),
                Visibility(
                  visible: useContactService,
                  child: OutlinedButtonWidget(
                    onTap: () => openWhatsApp(context),
                    borderColor: Colors.transparent,
                    label: lang.contact_us,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: SPACE_LARGE),
        ],
      ),
    );
  }

  Future<void> openWhatsApp(BuildContext context) async {
    final url = Uri.parse(WHATSAPP_ADMIN);
    final lang = AppLocalizations.of(context)!;
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        await showToast(msg: lang.whatsapp_not_installed);
        throw Exception('Could not launch WhatsApp');
      }
    } on PlatformException {
      await showToast(msg: lang.whatsapp_not_installed);
    } on Exception {
      await showToast(msg: lang.whatsapp_not_installed);
    }
  }
}
