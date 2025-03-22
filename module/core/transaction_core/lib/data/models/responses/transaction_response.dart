import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/data/models/transaction_model.dart';

class TransactionResponse extends Equatable {
  const TransactionResponse({
    required this.transactionList,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      transactionList: List<TransactionModel>.from(
        (json['data'] as List)
            .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<TransactionModel> transactionList;

  @override
  List<Object?> get props => [transactionList];
}
