part of 'notification_read_all_actor_bloc.dart';

@freezed
class NotificationReadAllActorEvent with _$NotificationReadAllActorEvent {
  const factory NotificationReadAllActorEvent.readAll() = _ReadAll;
}
