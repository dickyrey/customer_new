part of 'transaction_cancel_actor_bloc.dart';

@freezed
class TransactionCancelActorState with _$TransactionCancelActorState {
  const factory TransactionCancelActorState.initial() = _Initial;
  const factory TransactionCancelActorState.loading() = _Loading;
  const factory TransactionCancelActorState.error(
    String message,
  ) = _Error;
  const factory TransactionCancelActorState.success() = _Success;
}
