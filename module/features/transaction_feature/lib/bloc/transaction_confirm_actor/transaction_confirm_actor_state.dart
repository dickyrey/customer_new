part of 'transaction_confirm_actor_bloc.dart';

@freezed
class TransactionConfirmActorState with _$TransactionConfirmActorState {
  const factory TransactionConfirmActorState.initial() = _Initial;
  const factory TransactionConfirmActorState.loading() = _Loading;
  const factory TransactionConfirmActorState.error(
    String message,
  ) = _Error;
  const factory TransactionConfirmActorState.success(
    TransactionDetail transaction,
  ) = _Success;
}
