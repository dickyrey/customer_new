part of 'deposit_cancel_actor_bloc.dart';

@freezed
class DepositCancelActorEvent with _$DepositCancelActorEvent {
  const factory DepositCancelActorEvent.delete(int id) = _Delete;
}
