part of 'transaction_confirm_actor_bloc.dart';

@freezed
class TransactionConfirmActorEvent with _$TransactionConfirmActorEvent {
  const factory TransactionConfirmActorEvent.confirm(int id) = _Confirm;
}
