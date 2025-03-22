import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:deposit_core/domain/usecases/deposit_usecase.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'deposit_top_up_form_bloc.freezed.dart';
part 'deposit_top_up_form_event.dart';
part 'deposit_top_up_form_state.dart';

class DepositTopUpFormBloc
    extends Bloc<DepositTopUpFormEvent, DepositTopUpFormState> {
  DepositTopUpFormBloc(this._usecase) : super(DepositTopUpFormState.initial()) {
    on<DepositTopUpFormEvent>((event, emit) async {
      await event.map(
        deposit: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              deposit: event.v,
              message: '',
            ),
          );
        },
        send: (_) async {
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              isSubmit: true,
            ),
          );
          final result = await _usecase.createDeposit(int.parse(state.deposit));
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
            (data) {
              emit(
                state.copyWith(
                  state: RequestState.loaded,
                  message: '',
                  isSubmit: false,
                  depositDetail: data,
                ),
              );
            },
          );
        },
      );
    });
  }
  final DepositUsecase _usecase;
}
