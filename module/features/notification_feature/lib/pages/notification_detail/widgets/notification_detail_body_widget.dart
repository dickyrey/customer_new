import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notification_feature/bloc/notification_delete_actor/notification_delete_actor_bloc.dart';
import 'package:notification_feature/bloc/notification_detail_watcher/notification_detail_watcher_bloc.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/intl/intl.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';

class NotificationDetailBodyWidget extends StatelessWidget {
  const NotificationDetailBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<NotificationDetailWatcherBloc,
        NotificationDetailWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.notification.title,
                    style: theme.textTheme.labelLarge,
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Text(
                    state.notification.content,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Text(
                    DateFormat.yMMMMEEEEd('id-ID')
                        .format(state.notification.createdAt),
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  const Divider(thickness: 1.5),
                  const SizedBox(height: SPACE_LARGE),
                  BlocBuilder<NotificationDeleteActorBloc,
                      NotificationDeleteActorState>(
                    builder: (context, _) {
                      return state.maybeMap(
                        orElse: () {
                          return OutlinedButtonWidget(
                            onTap: () {
                              showConfirmationDialog(
                                context,
                                title:
                                    lang.are_you_sure_delete_this_notification,
                                primaryButtonLabel: lang.delete,
                                onPrimaryButtonTap: () {
                                  context
                                      .read<NotificationDeleteActorBloc>()
                                      .add(
                                        NotificationDeleteActorEvent.delete(
                                          state.notification.id,
                                        ),
                                      );
                                  Navigator.pop(context);
                                },
                              );
                            },
                            label: lang.delete_notification,
                          );
                        },
                        loading: (_) {
                          return OutlinedButtonWidget(
                            onTap: () {},
                            label: lang.delete_notification,
                            isLoading: true,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
