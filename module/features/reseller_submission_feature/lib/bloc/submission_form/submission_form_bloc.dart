import 'package:address_core/domain/entities/address.dart';
import 'package:address_core/domain/usecases/address_usecase.dart';
import 'package:reseller_core/domain/usecases/reseller_usecase.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'submission_form_bloc.freezed.dart';
part 'submission_form_event.dart';
part 'submission_form_state.dart';

class SubmissionFormBloc
    extends Bloc<SubmissionFormEvent, SubmissionFormState> {
  SubmissionFormBloc(
    this._addressCase,
    this._resellerCase,
  ) : super(SubmissionFormState.initial()) {
    on<SubmissionFormEvent>((event, emit) async {
      await event.map(
        fetchAddress: (_) async {
          emit(
            state.copyWith(
              state: RequestState.empty,
              selectedAddress: null,
              isFetchingAddress: true,
              isSubmit: false,
            ),
          );
          final result = await _addressCase.getAddressList();
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.error,
                  message: f.message,
                ),
              );
            },
            (data) {
              emit(
                state.copyWith(
                  state: RequestState.empty,
                  addressList: data,
                ),
              );
            },
          );
        },
        selectAddress: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              isFetchingAddress: false,
              selectedAddress: event.address,
            ),
          );
        },
        onChanged: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              name: event.v,
            ),
          );
        },
        send: (event) async {
          emit(
            state.copyWith(
              state: RequestState.empty,
              isFetchingAddress: false,
              isSubmit: true,
            ),
          );
          final result = await _resellerCase.submission(
            addressId: state.selectedAddress!.id,
            name: state.name,
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
            (data) {
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
  final AddressUsecase _addressCase;
  final ResellerUsecase _resellerCase;
}
