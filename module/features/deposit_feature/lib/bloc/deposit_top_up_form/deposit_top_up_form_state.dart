part of 'deposit_top_up_form_bloc.dart';

@freezed
class DepositTopUpFormState with _$DepositTopUpFormState {
  const factory DepositTopUpFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required String deposit,
    required DepositDetail? depositDetail,
  }) = _DepositTopUpFormState;

  factory DepositTopUpFormState.initial() {
    return const DepositTopUpFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      deposit: '',
      depositDetail: null,
    );
  }
}
