import 'package:authentication_core/domain/usecases/authentication_usecase.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:shared_libraries/injectable/injectable.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down_controller.dart';

part 'otp_form_bloc.freezed.dart';
part 'otp_form_event.dart';
part 'otp_form_state.dart';

@injectable
class OtpFormBloc extends Bloc<OtpFormEvent, OtpFormState> {
  OtpFormBloc(this._usecase) : super(OtpFormState.initial()) {
    on<OtpFormEvent>((event, emit) async {
      await event.map(
        init: (event) {
          emit(
            state.copyWith(
              phoneNumber: event.phoneNumber,
              state: RequestState.empty,
              message: '',
              isSubmit: false,
            ),
          );
          add(OtpFormEvent.startTimer(event.controller));
        },
        otpNumber: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              otpNumber: event.val,
              message: '',
              isSubmit: false,
            ),
          );
        },
        send: (event) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
              message: '',
            ),
          );
          final result = await _usecase.verificationOTP(
            otpCode: state.otpNumber,
            phoneNumber: state.phoneNumber,
          );
          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                message: f.message,
                isSubmit: false,
              ),
            ),
            (data) => emit(
              state.copyWith(
                state: RequestState.loaded,
                isSubmit: false,
                message: (data.isRegistered == '1') ? REGISTERED : UNREGISTERED,
              ),
            ),
          );
        },
        startTimer: (event) {
          event.controller.restart();
          emit(
            state.copyWith(
              isTimeoutDone: false,
              state: RequestState.empty,
              message: '',
            ),
          );
        },
        onTimerFinish: (event) {
          emit(state.copyWith(isTimeoutDone: true));
        },
      );
    });
  }
  final AuthenticationUsecase _usecase;
}
