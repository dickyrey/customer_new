part of 'signin_form_bloc.dart';

@freezed
class SigninFormEvent with _$SigninFormEvent {
  const factory SigninFormEvent.phoneNumber(String v) = _PhoneNumber;
  const factory SigninFormEvent.checkbox({required bool v}) = _Checkbox;
  const factory SigninFormEvent.signIn() = _SignIn;
}
