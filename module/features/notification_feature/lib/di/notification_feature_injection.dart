import 'package:notification_feature/bloc/notification_delete_actor/notification_delete_actor_bloc.dart';
import 'package:notification_feature/bloc/notification_detail_watcher/notification_detail_watcher_bloc.dart';
import 'package:notification_feature/bloc/notification_read_all_actor/notification_read_all_actor_bloc.dart';
import 'package:notification_feature/bloc/notification_watcher/notification_watcher_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class NotificationFeatureInjection {
  NotificationFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => NotificationDeleteActorBloc(locator()),
      )
      ..registerLazySingleton(
        () => NotificationDetailWatcherBloc(locator()),
      )
      ..registerLazySingleton(
        () => NotificationReadAllActorBloc(locator()),
      )
      ..registerLazySingleton(
        () => NotificationWatcherBloc(locator()),
      );
  }
}
