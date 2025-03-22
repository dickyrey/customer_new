import 'package:payment_core/data/models/payment_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class PaymentResponse extends Equatable {
  const PaymentResponse({
    required this.paymentList,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      paymentList: List<PaymentModel>.from(
        (json['data'] as List)
            .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<PaymentModel> paymentList;

  @override
  List<Object?> get props => [paymentList];
}
