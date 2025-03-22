part of 'change_number_form_bloc.dart';

@freezed
class ChangeNumberFormEvent with _$ChangeNumberFormEvent {
  const factory ChangeNumberFormEvent.init() = _Init;
  const factory ChangeNumberFormEvent.number(String v) = _Number;

  // OTP Code
  const factory ChangeNumberFormEvent.otp(String v) = _Otp;
  const factory ChangeNumberFormEvent.requestOtp() = _RequestOtp;

  // OTP Timer Cooldown
  const factory ChangeNumberFormEvent.startTimer(
    CountdownController controller,
  ) = _StartTimer;
  const factory ChangeNumberFormEvent.onTimerFinish() = _OnTimerFinish;

  // Send to API
  const factory ChangeNumberFormEvent.send() = _Send;
}
