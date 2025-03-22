part of 'transaction_cancel_actor_bloc.dart';

@freezed
class TransactionCancelActorEvent with _$TransactionCancelActorEvent {
  const factory TransactionCancelActorEvent.cancel(int id) = _Cancel;
}
