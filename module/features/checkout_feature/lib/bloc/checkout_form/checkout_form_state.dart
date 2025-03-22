part of 'checkout_form_bloc.dart';

@freezed
class CheckoutFormState with _$CheckoutFormState {
  const factory CheckoutFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required bool isPaymentListLoading,
    required bool isPaymentListError,

    // Point Activation
    required bool isPointActive,

    // Payment Method
    required TransactionPayment? selectedPayment,
    required List<TransactionPayment> paymentList,

    // Transaction Detail
    required TransactionDetail? transactionDetail,
  }) = _CheckoutFormState;

  factory CheckoutFormState.initial() {
    return const CheckoutFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      isPaymentListLoading: false,
      isPaymentListError: false,

      // Point Activation
      isPointActive: false,

      // Payment Method
      selectedPayment: null,
      paymentList: [
        // TransactionPayment(
        //   id: 1,
        //   name: 'BCA',
        //   description: 'Bca transaksi otomatis',
        //   image: 'image',
        //   bankAccount: '',
        //   type: 'transfer',
        // ),
        // TransactionPayment(
        //   id: 2,
        //   name: 'Cash',
        //   description: 'Bayar langsung di tempat',
        //   image: 'image',
        //   bankAccount: '',
        //   type: 'internal',
        // ),
        // TransactionPayment(
        //   id: 3,
        //   name: 'Deposit',
        //   description: 'Bayar pakai deposit biar cepat',
        //   image: 'image',
        //   bankAccount: '',
        //   type: 'cash',
        // ),
      ],
      transactionDetail: null,
    );
  }
}
