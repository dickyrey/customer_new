import 'package:authentication_core/domain/usecases/authentication_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:shared_libraries/injectable/injectable.dart';

part 'otp_resend_actor_bloc.freezed.dart';
part 'otp_resend_actor_event.dart';
part 'otp_resend_actor_state.dart';

@injectable
class OtpResendActorBloc
    extends Bloc<OtpResendActorEvent, OtpResendActorState> {
  OtpResendActorBloc(this._auth) : super(const _Initial()) {
    on<OtpResendActorEvent>((event, emit) async {
      await event.map(
        resend: (event) async {
          emit(const OtpResendActorState.loading());
          final result = await _auth.signIn(event.phoneNumber);
          result.fold(
            (f) => emit(OtpResendActorState.failed(f.message)),
            (_) => emit(const OtpResendActorState.success()),
          );
        },
      );
    });
  }
  final AuthenticationUsecase _auth;
}
