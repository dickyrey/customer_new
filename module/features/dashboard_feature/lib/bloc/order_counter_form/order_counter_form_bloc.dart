import 'package:product_core/domain/usecases/product_usecase.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'order_counter_form_bloc.freezed.dart';
part 'order_counter_form_event.dart';
part 'order_counter_form_state.dart';

class OrderCounterFormBloc
    extends Bloc<OrderCounterFormEvent, OrderCounterFormState> {
  OrderCounterFormBloc(this._usecase) : super(OrderCounterFormState.initial()) {
    on<OrderCounterFormEvent>((event, emit) async {
      await event.map(
        getStock: (value) async {
          emit(state.copyWith(state: RequestState.loading, message: ''));
          final result = await _usecase.getProductList();
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.error,
                  message: state.message,
                ),
              );
            },
            (data) {
              emit(
                state.copyWith(
                  state: RequestState.loaded,
                  stockRefill: data.first.stock,
                  price: data.first.price,
                  totalPrice: data.first.price,
                ),
              );
            },
          );
        },
        increaseQty: (event) {
          if (state.qty < state.stockRefill) {
            final qty = state.qty + 1;
            final price = state.price * qty;

            emit(
              state.copyWith(
                state: RequestState.empty,
                qty: qty,
                totalPrice: price,
              ),
            );
          }
        },
        decreaseQty: (event) {
          if (state.qty > 1) {
            final qty = state.qty - 1;
            final price = state.price * qty;

            emit(
              state.copyWith(
                state: RequestState.empty,
                qty: qty,
                totalPrice: price,
              ),
            );
          }
        },
      );
    });
  }
  final ProductUsecase _usecase;
}
