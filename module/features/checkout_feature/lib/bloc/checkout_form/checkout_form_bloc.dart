import 'dart:convert';

import 'package:payment_core/domain/usecases/payment_usecase.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';
import 'package:transaction_core/domain/entities/transaction_payment.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

part 'checkout_form_bloc.freezed.dart';
part 'checkout_form_event.dart';
part 'checkout_form_state.dart';

class CheckoutFormBloc extends Bloc<CheckoutFormEvent, CheckoutFormState> {
  CheckoutFormBloc(this._transactionCase, this._paymentUsecase)
      : super(CheckoutFormState.initial()) {
    on<CheckoutFormEvent>((event, emit) async {
      await event.map(
        point: (event) {
          if (state.isPointActive == true) {
            emit(
              state.copyWith(
                isPointActive: false,
                message: '',
              ),
            );
          } else {
            emit(
              state.copyWith(
                isPointActive: true,
                message: '',
              ),
            );
          }
        },
        getPaymentList: (_) async {
          emit(
            state.copyWith(
              state: RequestState.empty,
              isPaymentListLoading: true,
              isPaymentListError: false,
              message: '',
            ),
          );
          final result = await _paymentUsecase.getPaymentList();
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.empty,
                  isPaymentListLoading: false,
                  isPaymentListError: true,
                  message: f.message,
                ),
              );
            },
            (data) {
              final paymentList = data.map(
                (e) {
                  return TransactionPayment(
                    id: e.id,
                    name: e.name,
                    bankAccount: e.bankAccount,
                    description: e.description,
                    image: e.image,
                    type: e.type,
                  );
                },
              ).toList();
              emit(
                state.copyWith(
                  state: RequestState.empty,
                  isPaymentListLoading: false,
                  isPaymentListError: false,
                  message: '',
                  paymentList: paymentList,
                ),
              );
            },
          );
        },
        selectPayment: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              selectedPayment: event.v,
            ),
          );
        },
        send: (event) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final json = [
            {'id': 1, 'amount': event.qty},
            {'id': 2, 'amount': 0},
          ];
          final result = await _transactionCase.createTransaction(
            addressId: event.addressId,
            paymentId: state.selectedPayment!.id,
            jsonString: jsonEncode(json),
            isUsePoint: state.isPointActive,
          );
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.error,
                  isSubmit: false,
                  message: f.message,
                ),
              );
            },
            (data) {
              emit(
                state.copyWith(
                  state: RequestState.loaded,
                  isSubmit: false,
                  transactionDetail: data,
                ),
              );
            },
          );
        },
      );
    });
  }
  final TransactionUsecase _transactionCase;
  final PaymentUsecase _paymentUsecase;
}
