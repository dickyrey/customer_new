part of 'otp_resend_actor_bloc.dart';

@freezed
class OtpResendActorEvent with _$OtpResendActorEvent {
  const factory OtpResendActorEvent.resend(String phoneNumber) = _Resend;
}
