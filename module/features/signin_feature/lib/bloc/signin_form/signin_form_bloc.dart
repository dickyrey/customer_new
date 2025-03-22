import 'package:authentication_core/domain/usecases/authentication_usecase.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'signin_form_event.dart';
part 'signin_form_state.dart';
part 'signin_form_bloc.freezed.dart';

class SigninFormBloc extends Bloc<SigninFormEvent, SigninFormState> {
  SigninFormBloc(this._usecase) : super(SigninFormState.initial()) {
    on<SigninFormEvent>((event, emit) async {
      await event.map(
        phoneNumber: (event) {
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
              phoneNumber: event.v,
              formattedPhoneNumber: result,
              message: '',
            ),
          );
        },
        checkbox: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              isAcceptPrivacyPolicy: event.v,
            ),
          );
        },
        signIn: (event) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final result = await _usecase.signIn(
            state.formattedPhoneNumber,
          );
          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                isSubmit: false,
                message: f.message,
              ),
            ),
            (data) => emit(
              state.copyWith(
                state: RequestState.loaded,
                isSubmit: false,
                phoneNumber: '',
              ),
            ),
          );
        },
      );
    });
  }
  final AuthenticationUsecase _usecase;
}
