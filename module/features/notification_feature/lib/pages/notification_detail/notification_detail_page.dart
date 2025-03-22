import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notification_feature/bloc/notification_delete_actor/notification_delete_actor_bloc.dart';
import 'package:notification_feature/bloc/notification_detail_watcher/notification_detail_watcher_bloc.dart';
import 'package:notification_feature/bloc/notification_watcher/notification_watcher_bloc.dart';
import 'package:notification_feature/pages/notification_detail/widgets/notification_detail_body_widget.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class NotificationDetailPage extends StatefulWidget {
  const NotificationDetailPage({required this.args, super.key});
  final int args;

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<NotificationDetailWatcherBloc>()
            .add(NotificationDetailWatcherEvent.fetch(widget.args));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationDeleteActorBloc, NotificationDeleteActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (state) {
                if (state.message == UNAUTHENTICTED) {
                  showToast(
                    msg: lang.session_expired_please_login_to_continue,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
              success: (_) {
                showToast(msg: lang.notification_deleted);
                context
                    .read<NotificationWatcherBloc>()
                    .add(const NotificationWatcherEvent.fetch(0));
                Navigator.pop(context);
              },
            );
          },
        ),
        BlocListener<NotificationDetailWatcherBloc,
            NotificationDetailWatcherState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (state) {
                if (state.message == UNAUTHENTICTED) {
                  showToast(
                    msg: lang.session_expired_please_login_to_continue,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            lang.notification,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: const NotificationDetailBodyWidget(),
      ),
    );
  }
}
