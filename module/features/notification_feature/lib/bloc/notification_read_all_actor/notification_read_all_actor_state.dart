part of 'notification_read_all_actor_bloc.dart';

@freezed
class NotificationReadAllActorState with _$NotificationReadAllActorState {
  const factory NotificationReadAllActorState.initial() = _Initial;
  const factory NotificationReadAllActorState.loading() = _Loading;
  const factory NotificationReadAllActorState.error(String message) = _Error;
  const factory NotificationReadAllActorState.success() = _Success;
}
