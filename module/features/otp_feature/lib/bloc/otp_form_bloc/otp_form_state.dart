part of 'otp_form_bloc.dart';

@freezed
class OtpFormState with _$OtpFormState {
  const factory OtpFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required bool isTimeoutDone,
    required int time,
    required String otpNumber,
    required String phoneNumber,
  }) = _OtpFormState;

  factory OtpFormState.initial() {
    return const OtpFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      isTimeoutDone: false,
      time: 59,
      otpNumber: '',
      phoneNumber: '',
    );
  }
}
