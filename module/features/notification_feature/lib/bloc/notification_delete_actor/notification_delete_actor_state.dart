part of 'notification_delete_actor_bloc.dart';

@freezed
class NotificationDeleteActorState with _$NotificationDeleteActorState {
  const factory NotificationDeleteActorState.initial() = _Initial;
  const factory NotificationDeleteActorState.loading() = _Loading;
  const factory NotificationDeleteActorState.error(String message) = _Error;
  const factory NotificationDeleteActorState.success() = _Success;
}
