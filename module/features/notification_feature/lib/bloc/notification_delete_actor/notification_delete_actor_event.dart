part of 'notification_delete_actor_bloc.dart';

@freezed
class NotificationDeleteActorEvent with _$NotificationDeleteActorEvent {
  const factory NotificationDeleteActorEvent.delete(int id) = _Delete;
  const factory NotificationDeleteActorEvent.deleteAll(int id) = _DeleteAll;
}
