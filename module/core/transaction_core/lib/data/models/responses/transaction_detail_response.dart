import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/data/models/transaction_detail_model.dart';

class TransactionDetailResponse extends Equatable {
  const TransactionDetailResponse({
    required this.transactionDetail,
  });

  factory TransactionDetailResponse.fromJson(Map<String, dynamic> json) {
    return TransactionDetailResponse(
      transactionDetail: TransactionDetailModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final TransactionDetailModel transactionDetail;

  @override
  List<Object?> get props => [transactionDetail];
}
