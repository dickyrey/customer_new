part of 'checkout_form_bloc.dart';

@freezed
class CheckoutFormEvent with _$CheckoutFormEvent {
  const factory CheckoutFormEvent.point() = _Point;

  // Fetch Payment List from API
  const factory CheckoutFormEvent.getPaymentList() = _GetPaymentList;

  // Payment Method
  const factory CheckoutFormEvent.selectPayment(
    TransactionPayment v,
  ) = _SelectPayment;

  // Send to API
  const factory CheckoutFormEvent.send({
    required int addressId,
    required int qty,
  }) = _Send;
}
