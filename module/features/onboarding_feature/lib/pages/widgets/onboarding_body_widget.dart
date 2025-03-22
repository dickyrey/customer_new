import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/image_constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AssetImages.onboarding,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN,
              vertical: SPACE_VERY_LARGE,
            ),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(RADIUS),
                topRight: Radius.circular(RADIUS),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  capitalizeEachWordFormat(lang.onboarding_title),
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Text(
                  lang.onboarding_subtitle,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: SPACE_VERY_LARGE + 10),
                ElevatedButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.signIn,
                    );
                  },
                  label: lang.start_now,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
