part of 'signin_form_bloc.dart';

@freezed
class SigninFormState with _$SigninFormState {
  const factory SigninFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required bool isAcceptPrivacyPolicy,
    required String phoneNumber,
    required String formattedPhoneNumber,
  }) = _SigninFormState;

  factory SigninFormState.initial() {
    return const SigninFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      isAcceptPrivacyPolicy: false,
      phoneNumber: '',
      formattedPhoneNumber: '',
    );
  }
}
