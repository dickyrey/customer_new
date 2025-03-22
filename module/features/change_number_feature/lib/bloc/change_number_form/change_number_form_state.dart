part of 'change_number_form_bloc.dart';

@freezed
class ChangeNumberFormState with _$ChangeNumberFormState {
  const factory ChangeNumberFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required String number,
    required String formattedPhoneNumber,

    // OTP Code
    required bool isOTPEnable,
    required String otpCode,

    // OTP Timer Cooldown
    required bool isTimeoutDone,
    required int time,
  }) = _UserFormState;

  factory ChangeNumberFormState.initial() {
    return const ChangeNumberFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      number: '',
      formattedPhoneNumber: '',

      // OTP Code
      isOTPEnable: false,
      otpCode: '',

      // OTP Timer Cooldown
      isTimeoutDone: true,
      time: 59,
    );
  }
}
