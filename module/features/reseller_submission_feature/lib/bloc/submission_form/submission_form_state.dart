part of 'submission_form_bloc.dart';

@freezed
class SubmissionFormState with _$SubmissionFormState {
  const factory SubmissionFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,

    // Address
    required bool isFetchingAddress,
    required List<Address> addressList,
    required Address? selectedAddress,

    // Store
    required String name,
  }) = _SubmissionFormState;

  factory SubmissionFormState.initial() {
    return const SubmissionFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,

      // Address
      isFetchingAddress: false,
      addressList: [],
      selectedAddress: null,

      // Store
      name: '',
    );
  }
}
