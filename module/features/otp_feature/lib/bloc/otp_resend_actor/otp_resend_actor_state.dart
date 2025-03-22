part of 'otp_resend_actor_bloc.dart';

@freezed
class OtpResendActorState with _$OtpResendActorState {
  const factory OtpResendActorState.initial() = _Initial;
  const factory OtpResendActorState.loading() = _Loading;
  const factory OtpResendActorState.failed(String message) = _Failed;
  const factory OtpResendActorState.success() = _Success;
}
