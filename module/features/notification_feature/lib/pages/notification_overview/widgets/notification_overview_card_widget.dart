import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notification_core/domain/entities/notification.dart';
import 'package:notification_feature/bloc/notification_delete_actor/notification_delete_actor_bloc.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/flutter_slidable/flutter_slidable.dart';
import 'package:shared_libraries/intl/intl.dart';

class NotificationOverviewCardWidget extends StatelessWidget {
  const NotificationOverviewCardWidget({required this.data, super.key});
  final Notifications data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    IconData notificationIcon(String v) {
      switch (v) {
        case 'security':
          return FeatherIcons.shield;
        case 'transaction':
          return FeatherIcons.fileText;
        case 'promotion':
          return FeatherIcons.gift;
        default:
          return FeatherIcons.aperture;
      }
    }

    String notificationTitle(String v) {
      switch (v) {
        case 'security':
          return lang.security;
        case 'transaction':
          return lang.transaction;
        case 'promotion':
          return lang.promotion;
        default:
          return lang.announcement;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: SPACE_MEDIUM),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (v) {
                context
                    .read<NotificationDeleteActorBloc>()
                    .add(NotificationDeleteActorEvent.delete(data.id));
              },
              icon: FeatherIcons.trash2,
              backgroundColor: theme.colorScheme.error,
            ),
          ],
        ),
        child: Card(
          color: data.isReaded
              ? theme.cardColor
              : theme.primaryColor.withOpacity(.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RADIUS),
          ),
          // margin: const EdgeInsets.only(bottom: SPACE_MEDIUM),
          child: InkWell(
            borderRadius: BorderRadius.circular(RADIUS),
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.notificationDetail,
                arguments: data.id,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SPACE_SMALL,
                vertical: SPACE_TINY,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    notificationIcon(data.type),
                    color: theme.primaryColor,
                    size: 25,
                  ),
                  const SizedBox(width: SPACE_MEDIUM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notificationTitle(data.type),
                          style: theme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: SPACE_TINY),
                        Text(
                          data.title,
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: SPACE_MEDIUM),
                        Text(
                          DateFormat.yMMMMEEEEd('id-ID').format(data.createdAt),
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
