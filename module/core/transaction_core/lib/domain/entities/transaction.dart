import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/domain/entities/transaction_product.dart';

class Transaction extends Equatable {
  const Transaction({
    required this.id,
    required this.total,
    required this.status,
    required this.isReviewed,
    required this.productList,
  });

  final int id;
  final int total;
  final String status;
  final bool isReviewed;
  final List<TransactionProduct> productList;

  @override
  List<Object?> get props => [
        id,
        total,
        status,
        isReviewed,
        productList,
      ];
}
