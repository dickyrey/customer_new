part of 'notification_watcher_bloc.dart';

@freezed
class NotificationWatcherEvent with _$NotificationWatcherEvent {
  const factory NotificationWatcherEvent.fetch(int indexFilter) = _Fetch;
  const factory NotificationWatcherEvent.refresh(int indexFilter) = _Refresh;
  const factory NotificationWatcherEvent.next(int indexFilter) = _Next;
}
