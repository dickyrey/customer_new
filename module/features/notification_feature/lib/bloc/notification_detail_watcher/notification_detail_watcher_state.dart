part of 'notification_detail_watcher_bloc.dart';

@freezed
class NotificationDetailWatcherState with _$NotificationDetailWatcherState {
  const factory NotificationDetailWatcherState.initial() = _Initial;
  const factory NotificationDetailWatcherState.loading() = _Loading;
  const factory NotificationDetailWatcherState.error(String message) = _Error;
  const factory NotificationDetailWatcherState.loaded(
    NotificationDetail notification,
  ) = _Loaded;
}
