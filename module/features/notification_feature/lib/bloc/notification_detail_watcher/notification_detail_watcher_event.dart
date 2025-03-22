part of 'notification_detail_watcher_bloc.dart';

@freezed
class NotificationDetailWatcherEvent with _$NotificationDetailWatcherEvent {
  const factory NotificationDetailWatcherEvent.fetch(int id) = _Fetch;
}
