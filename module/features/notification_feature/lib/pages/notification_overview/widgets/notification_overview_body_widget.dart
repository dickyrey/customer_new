import 'package:flutter/material.dart';
import 'package:notification_feature/bloc/notification_watcher/notification_watcher_bloc.dart';
import 'package:notification_feature/pages/notification_overview/widgets/notification_overview_card_widget.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';

class NotificationOverviewBodyWidget extends StatelessWidget {
  const NotificationOverviewBodyWidget({
    required this.controller,
    required this.hasReachedMax,
    super.key,
  });

  final ScrollController controller;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationWatcherBloc, NotificationWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            if (state.notificationList.isNotEmpty) {
              return ListView.builder(
                controller: controller,
                itemCount: hasReachedMax
                    ? state.notificationList.length
                    : state.notificationList.length + 1,
                padding: const EdgeInsets.all(MARGIN),
                itemBuilder: (context, index) {
                  if (index == state.notificationList.length &&
                      hasReachedMax != true) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final data = state.notificationList[index];

                  return NotificationOverviewCardWidget(
                    data: data,
                  );
                },
              );
            }
            return const EmptyBodyWidget(
              type: EmptyBodyType.notification,
            );
          },
        );
      },
    );
  }
}
