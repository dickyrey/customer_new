part of 'change_name_form_bloc.dart';

@freezed
class ChangeNameFormState with _$ChangeNameFormState {
  const factory ChangeNameFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required String fullName,

    // Sales
    required bool isFetchingSales,
    required List<Sales> salesList,
    required Sales? selectedSales,
  }) = _UserFormState;

  factory ChangeNameFormState.initial() {
    return const ChangeNameFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      fullName: '',

      // Sales
      isFetchingSales: false,
      salesList: [],
      selectedSales: null,
    );
  }
}
