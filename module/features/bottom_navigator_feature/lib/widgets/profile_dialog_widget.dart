import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/url_launcher/url_launcher.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class ProfileDialogWidget extends StatelessWidget {
  const ProfileDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<AuthWatcherBloc, AuthWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const SizedBox();
          },
          authenticated: (state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(
                MARGIN,
                SPACE_SMALL,
                MARGIN,
                SPACE_SMALL,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(RADIUS),
                      color: theme.hintColor,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          lang.what_do_you_want_to_do,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(width: SPACE_LARGE * 2),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(FeatherIcons.x),
                        color: theme.textTheme.titleLarge?.color,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(
                        context,
                        Routes.submission,
                        arguments: state.user.name,
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FeatherIcons.briefcase,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                    title: Text(
                      lang.reseller_application,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(
                        context,
                        Routes.changeName,
                        arguments: state.user,
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FeatherIcons.user,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                    title: Text(
                      lang.my_account,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),

                  // ListTile(
                  //   onTap: () async {
                  //     Navigator.pop(context);
                  //     if (!await launchUrl(
                  //       Uri.parse(FAQ),
                  //       mode: LaunchMode.externalApplication,
                  //     )) {
                  //       throw Exception('Could not launch ');
                  //     }
                  //   },
                  //   contentPadding: EdgeInsets.zero,
                  //   leading: Icon(
                  //     FeatherIcons.helpCircle,
                  //     color: theme.textTheme.titleLarge?.color,
                  //   ),
                  //   title: Text(
                  //     lang.faq,
                  //     style: theme.textTheme.titleLarge,
                  //   ),
                  // ),
                  ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(
                        context,
                        Routes.address,
                        arguments: state.user,
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FeatherIcons.mapPin,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                    title: Text(
                      lang.my_address,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  ExpansionTile(
                    tilePadding: const EdgeInsets.only(right: MARGIN),
                    title: MenuListTile(
                      label: lang.about_hs68,
                      icon: FeatherIcons.info,
                    ),
                    children: [
                      MenuListTile(
                        label: lang.faq,
                        onTap: () async {
                          Navigator.pop(context);
                          if (!await launchUrl(
                            Uri.parse(FAQ),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch ');
                          }
                        },
                      ),
                      MenuListTile(
                        label: lang.privacy_policy,
                        onTap: () async {
                          Navigator.pop(context);

                          if (!await launchUrl(
                            Uri.parse(PRIVACY_POLICY),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch ');
                          }
                        },
                      ),
                      MenuListTile(
                        label: lang.terms_and_condition,
                        onTap: () async {
                          Navigator.pop(context);

                          if (!await launchUrl(
                            Uri.parse(TERM_AND_CONDITION),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch ');
                          }
                        },
                      ),

                      // Visibility(
                      //   visible: Platform.isAndroid,
                      //   child: MenuListTile(
                      //     label: lang.rate_this_app,
                      //     onTap: () {
                      //       StoreRedirect.redirect(
                      //         androidAppId: PACKAGE_NAME,
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),

                  ListTile(
                    onTap: () {
                      context
                          .read<AuthWatcherBloc>()
                          .add(const AuthWatcherEvent.signOut());
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FeatherIcons.logOut,
                      color: theme.colorScheme.error,
                    ),
                    title: Text(
                      lang.exit,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Text(
                    lang.any_issues_using_the_app,
                    style: theme.textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () => openWhatsApp(context),
                    child: Text(
                      lang.contact_us,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(color: theme.primaryColor),
                    ),
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Text(
                    'Ver $APP_VERSION',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          },
        );
      },
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
    } catch (e) {
      await showToast(msg: lang.whatsapp_not_installed);
    }
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    required this.label,
    this.onTap,
    this.subtitle,
    this.icon,
    this.bottomSpacing,
    this.trailing,
    super.key,
  });

  final String label;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onTap;
  final double? bottomSpacing;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: bottomSpacing ?? SPACE_MEDIUM,
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: theme.textTheme.titleLarge?.color,
              )
            else
              const SizedBox(),
            if (icon != null)
              const SizedBox(width: SPACE_LARGE + 5)
            else
              const SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.titleLarge,
                  ),
                  if (subtitle != null)
                    const SizedBox(height: SPACE_TINY - 3)
                  else
                    const SizedBox(),
                  if (subtitle != null)
                    Text(
                      subtitle ?? '',
                      style: theme.textTheme.titleLarge,
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
            if (trailing != null) trailing! else const SizedBox(),
          ],
        ),
      ),
    );
  }
}
