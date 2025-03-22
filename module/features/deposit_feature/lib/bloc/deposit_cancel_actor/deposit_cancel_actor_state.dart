part of 'deposit_cancel_actor_bloc.dart';

@freezed
class DepositCancelActorState with _$DepositCancelActorState {
  const factory DepositCancelActorState.initial() = _Initial;
  const factory DepositCancelActorState.loading() = _Loading;
  const factory DepositCancelActorState.error(String message) = _Error;
  const factory DepositCancelActorState.success() = _Success;
}
