import 'package:otp_feature/bloc/otp_form_bloc/otp_form_bloc.dart';
import 'package:otp_feature/bloc/otp_resend_actor/otp_resend_actor_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class OtpFeatureInjection {
  OtpFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => OtpFormBloc(locator()),
      )
      ..registerLazySingleton(
        () => OtpResendActorBloc(locator()),
      );
  }
}
