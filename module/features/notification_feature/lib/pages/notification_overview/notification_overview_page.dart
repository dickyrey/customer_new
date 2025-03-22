import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notification_feature/bloc/notification_delete_actor/notification_delete_actor_bloc.dart';
import 'package:notification_feature/bloc/notification_read_all_actor/notification_read_all_actor_bloc.dart';
import 'package:notification_feature/bloc/notification_watcher/notification_watcher_bloc.dart';
import 'package:notification_feature/pages/notification_overview/widgets/notification_overview_body_widget.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class NotificationOverviewPage extends StatefulWidget {
  const NotificationOverviewPage({super.key});

  @override
  State<NotificationOverviewPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationOverviewPage> {
  late ScrollController _controller;
  bool _hasReachedMax = false;
  int _selectedFilter = 0;

  List<String> _orderFilterList(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return [
      lang.all,
      lang.security,
      lang.transaction,
      lang.promotion,
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<NotificationWatcherBloc>().add(
                  NotificationWatcherEvent.next(_selectedFilter),
                );
          });
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<NotificationWatcherBloc>()
          .add(NotificationWatcherEvent.fetch(_selectedFilter));
    });
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
              },
            );
          },
        ),
        BlocListener<NotificationReadAllActorBloc,
            NotificationReadAllActorState>(
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
                showToast(msg: lang.all_notifications_read);
                context
                    .read<NotificationWatcherBloc>()
                    .add(const NotificationWatcherEvent.fetch(0));
              },
            );
          },
        ),
        BlocListener<NotificationWatcherBloc, NotificationWatcherState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              failed: (state) {
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
              loaded: (state) {
                if (state.hasReachedMax) {
                  setState(() {
                    _hasReachedMax = state.hasReachedMax;
                  });
                }
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.cardColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FeatherIcons.arrowLeft),
          ),
          title: Text(
            lang.all_notification,
            style: theme.textTheme.headlineMedium,
          ),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(
                FeatherIcons.moreVertical,
                color: theme.iconTheme.color,
              ),
              onSelected: (value) {
                switch (value) {
                  case '1':
                    context
                        .read<NotificationReadAllActorBloc>()
                        .add(const NotificationReadAllActorEvent.readAll());
                    setState(() {
                      _selectedFilter = 0;
                      _hasReachedMax = false;
                    });
                  case '2':
                    context
                        .read<NotificationDeleteActorBloc>()
                        .add(const NotificationDeleteActorEvent.deleteAll(0));
                    setState(() {
                      _selectedFilter = 0;
                      _hasReachedMax = false;
                    });
                  default:
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: '1',
                    child: Text(
                      lang.marks_all_as_read,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  PopupMenuItem(
                    value: '2',
                    child: Text(
                      lang.clear_notifications,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Column(
          children: [
            ColoredBox(
              color: theme.cardColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                      MARGIN,
                      SPACE_MEDIUM,
                      MARGIN,
                      SPACE_MEDIUM,
                    ),
                    width: double.infinity,
                    height: 70,
                    child: ListView.builder(
                      itemCount: _orderFilterList(context).length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final data = _orderFilterList(context)[index];

                        return Padding(
                          padding: const EdgeInsets.only(right: SPACE_MEDIUM),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedFilter = index;
                                _hasReachedMax = false;
                              });
                              context.read<NotificationWatcherBloc>().add(
                                    NotificationWatcherEvent.fetch(
                                      _selectedFilter,
                                    ),
                                  );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: SPACE_SMALL,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: theme.primaryColor),
                                borderRadius: BorderRadius.circular(RADIUS),
                                color: _selectedFilter == index
                                    ? theme.primaryColor
                                    : theme.cardColor,
                              ),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: index == _selectedFilter,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.only(right: SPACE_SMALL),
                                      child: Icon(
                                        FeatherIcons.grid,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: index == _selectedFilter
                                          ? Colors.white
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NotificationOverviewBodyWidget(
                controller: _controller,
                hasReachedMax: _hasReachedMax,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
