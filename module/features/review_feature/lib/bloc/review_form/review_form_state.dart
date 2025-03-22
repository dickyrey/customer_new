part of 'review_form_bloc.dart';

@freezed
class ReviewFormState with _$ReviewFormState {
  const factory ReviewFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required bool isFetchingTransaction,
    required double value,
    required String review,
  }) = _ReviewFormState;

  factory ReviewFormState.initial() {
    return const ReviewFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      isFetchingTransaction: false,
      value: 0,
      review: '',
    );
  }
}
