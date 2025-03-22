part of 'order_counter_form_bloc.dart';

@freezed
class OrderCounterFormState with _$OrderCounterFormState {
  const factory OrderCounterFormState({
    required RequestState state,
    required String message,

    // Stock
    required int stockRefill,

    // Counter
    required int price,
    required int qty,
    required int totalPrice,
  }) = _OrderCounterFormState;

  factory OrderCounterFormState.initial() {
    return const OrderCounterFormState(
      state: RequestState.empty,
      message: '',
      stockRefill: 0,
      qty: 1,
      price: 0,
      totalPrice: 0,
    );
  }
}
