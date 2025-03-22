part of 'order_counter_form_bloc.dart';

@freezed
class OrderCounterFormEvent with _$OrderCounterFormEvent {
  const factory OrderCounterFormEvent.getStock() = _GetStock;
  const factory OrderCounterFormEvent.increaseQty() = _IncreaseQty;
  const factory OrderCounterFormEvent.decreaseQty() = _DecreaseQty;
}
