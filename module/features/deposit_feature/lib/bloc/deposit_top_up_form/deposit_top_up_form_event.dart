part of 'deposit_top_up_form_bloc.dart';

@freezed
class DepositTopUpFormEvent with _$DepositTopUpFormEvent {
  const factory DepositTopUpFormEvent.deposit(String v) = _Deposit;

  // Send to API
  const factory DepositTopUpFormEvent.send() = _Send;
}
