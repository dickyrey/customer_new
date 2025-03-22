part of 'otp_form_bloc.dart';

@freezed
class OtpFormEvent with _$OtpFormEvent {
  const factory OtpFormEvent.init({
    required CountdownController controller,
    required String phoneNumber,
  }) = _Init;
  const factory OtpFormEvent.otpNumber(String val) = _OTPNumber;
  const factory OtpFormEvent.send() = _Send;

  // Timer countdown
  const factory OtpFormEvent.startTimer(CountdownController controller) =
      _StartTimer;
  const factory OtpFormEvent.onTimerFinish() = _OnTimerFinish;
}
