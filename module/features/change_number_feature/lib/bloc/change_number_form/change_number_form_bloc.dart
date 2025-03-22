import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down_controller.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:user_core/domain/usecases/user_usecase.dart';

part 'change_number_form_bloc.freezed.dart';
part 'change_number_form_event.dart';
part 'change_number_form_state.dart';

class ChangeNumberFormBloc
    extends Bloc<ChangeNumberFormEvent, ChangeNumberFormState> {
  ChangeNumberFormBloc(this._usecase) : super(ChangeNumberFormState.initial()) {
    on<ChangeNumberFormEvent>((event, emit) async {
      await event.map(
        init: (value) {
          emit(ChangeNumberFormState.initial());
        },
        number: (event) {
          var digits = event.v.replaceAll(RegExp(r'[^\d]'), '');

          if (digits.startsWith('0')) {
            digits = '62${digits.substring(1)}';
          } else if (event.v.startsWith('8')) {
            digits = '628${digits.substring(1)}';
          }

          final result = digits;
          emit(
            state.copyWith(
              state: RequestState.empty,
              number: event.v,
              formattedPhoneNumber: result,
              message: '',
              isOTPEnable: false,
            ),
          );
        },
        otp: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              otpCode: event.v,
              message: '',
              isSubmit: false,
            ),
          );
        },
        requestOtp: (_) async {
          emit(
            state.copyWith(
              message: '',
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final result = await _usecase.requestOTP(
            state.formattedPhoneNumber,
          );
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.error,
                  message: f.message,
                  isSubmit: false,
                ),
              );
            },
            (_) {
              showToast(msg: 'Permintaan Kode OTP dikirim!');
              emit(
                state.copyWith(
                  state: RequestState.empty,
                  isSubmit: false,
                  isOTPEnable: true,
                  isTimeoutDone: false,
                ),
              );
            },
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
        send: (_) async {
          emit(
            state.copyWith(
              message: '',
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final result = await _usecase.security(
            phoneNumber: state.formattedPhoneNumber,
            otpCode: state.otpCode,
          );
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.error,
                  message: f.message,
                  isSubmit: false,
                ),
              );
            },
            (_) {
              emit(
                state.copyWith(
                  state: RequestState.loaded,
                  isSubmit: false,
                ),
              );
            },
          );
        },
      );
    });
  }
  final UserUsecase _usecase;
}
