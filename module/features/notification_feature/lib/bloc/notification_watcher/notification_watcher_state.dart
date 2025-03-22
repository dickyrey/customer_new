part of 'notification_watcher_bloc.dart';

@freezed
class NotificationWatcherState with _$NotificationWatcherState {
  const factory NotificationWatcherState.initial() = _Initial;
  const factory NotificationWatcherState.loading() = _Loading;
  const factory NotificationWatcherState.failed(String message) = _Failed;
  const factory NotificationWatcherState.loaded({
    required bool hasReachedMax,
    required List<Notifications> notificationList,
  }) = _Loaded;
}
